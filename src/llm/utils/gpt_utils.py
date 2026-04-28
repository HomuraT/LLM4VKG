import openai
import os
from openai import OpenAI

from zhipuai import ZhipuAI
import requests
import json

from src.llm.utils.answer_format.utils import get_format_by_name
from pydantic import TypeAdapter
from pydantic import BaseModel

from config import model_config


def _json_safe_dumps(data):
    try:
        return json.dumps(data, ensure_ascii=False, indent=2, default=str)
    except TypeError:
        return json.dumps(str(data), ensure_ascii=False, indent=2)


def _model_to_json_schema(model_like):
    if model_like is None:
        return None

    if isinstance(model_like, dict):
        return model_like

    if isinstance(model_like, str):
        lowered = model_like.lower()
        if lowered in {"json", "json_object"}:
            return "json"

        named_format = get_format_by_name(model_like)
        if named_format is not None:
            model_like = named_format
        else:
            return model_like

    if isinstance(model_like, type) and issubclass(model_like, BaseModel):
        return model_like.model_json_schema()

    if isinstance(model_like, BaseModel):
        return model_like.__class__.model_json_schema()

    if hasattr(model_like, "model_json_schema"):
        return model_like.model_json_schema()

    if hasattr(model_like, "schema"):
        return model_like.schema()

    return model_like


class OpenAI_API:
    _initialized_debug_files = set()

    def __init__(self, url, model, api_key=None, history=None, max_new_tokens=None, api_type=None):
        self.url = url
        self.api_key = api_key
        self.model = model
        self.api_type = api_type or self._infer_api_type(url=url, model=model, api_key=api_key)

        openai.api_base = url
        openai.api_key = api_key if api_key else 'none'
        self.temperature = model_config["temperature"]
        self.max_new_tokens = max_new_tokens

        if 'glm' in model:
            if 'chatglm' in model:
                self.client = ZhipuAI(api_key=self.api_key, base_url=self.url)
            elif 'glm-4-9b' in model:
                self.model = 'glm-4'
                self.client = OpenAI(api_key=self.api_key, base_url=self.url)
            else:
                self.client = ZhipuAI(api_key=self.api_key)
            if self.temperature == 0:
                self.temperature = 0.01
        elif self.api_type == 'ollama':
            self.client = OpenAI(
                api_key=openai.api_key,
                base_url=self.url
            )
        else:
            self.client = OpenAI(
                api_key=openai.api_key,
                base_url=self.url,
            )

        self.history = history if history else []
        self.debug_ollama = os.getenv("LLM4VKG_DEBUG_OLLAMA", "").lower() in {"1", "true", "yes", "on"}
        self.debug_ollama_file = os.getenv("LLM4VKG_DEBUG_OLLAMA_FILE")
        self.debug_ollama_stdout = os.getenv("LLM4VKG_DEBUG_OLLAMA_STDOUT", "0").lower() in {"1", "true", "yes", "on"}
        self.ollama_timeout_seconds = int(os.getenv("LLM4VKG_OLLAMA_TIMEOUT_SECONDS", "3600"))

    @staticmethod
    def _infer_api_type(url, model, api_key):
        if api_key == 'ollama':
            return 'ollama'
        if url and '/api/chat' in url and 'localhost' in url:
            return 'ollama'
        return 'openai'

    def _debug_log(self, title, payload):
        if not self.debug_ollama:
            return

        text = f"[LLM4VKG OLLAMA DEBUG] {title}\n{payload}\n"
        if self.debug_ollama_file:
            log_dir = os.path.dirname(self.debug_ollama_file)
            if log_dir:
                os.makedirs(log_dir, exist_ok=True)
            if self.debug_ollama_file not in self._initialized_debug_files:
                with open(self.debug_ollama_file, "w", encoding="utf-8") as f:
                    f.write("")
                self._initialized_debug_files.add(self.debug_ollama_file)
            with open(self.debug_ollama_file, "a", encoding="utf-8") as f:
                f.write(text)
        if self.debug_ollama_stdout or not self.debug_ollama_file:
            print(text, flush=True)

    def send_messages(self, messages, **kwargs):
        openai.api_base = self.url
        openai.api_key = self.api_key

        response_format = kwargs.get('response_format')

        if self.api_type == 'ollama':
            ollama_kwargs = dict(kwargs)
            ollama_format = _model_to_json_schema(ollama_kwargs.pop('response_format', None))

            options = dict(ollama_kwargs.pop("options", {}))
            if self.max_new_tokens is not None and "num_predict" not in options:
                options["num_predict"] = self.max_new_tokens

            headers = {
                "Content-Type": "application/json"
            }

            data = {
                "model": self.model,
                "messages": messages,
                "stream": False,
                "options": {
                    "use_mmap": False,
                    "temperature": self.temperature,
                    **options,
                },
                **ollama_kwargs
            }
            if ollama_format is not None:
                data["format"] = ollama_format

            if self.temperature>0.01:
                data['do_sample'] = True
            else:
                data['do_sample'] = False

            self._debug_log("request_url", self.url)
            self._debug_log("request_payload", _json_safe_dumps(data))

            response = requests.post(
                self.url,
                headers=headers,
                data=json.dumps(data),
                timeout=self.ollama_timeout_seconds,
            )

            self._debug_log(
                "response_meta",
                _json_safe_dumps(
                    {
                        "status_code": response.status_code,
                        "headers": dict(response.headers),
                    }
                ),
            )
            self._debug_log("response_text", response.text)

            response.raise_for_status()
            try:
                parsed_response = response.json()
            except json.JSONDecodeError as e:
                raise ValueError(
                    f"Ollama returned a non-JSON response: {e}\nRaw response:\n{response.text}"
                ) from e

            self._debug_log("response_json", _json_safe_dumps(parsed_response))

            return parsed_response

        if response_format != None:
            if type(response_format) == str:
                kwargs['response_format'] = get_format_by_name(response_format)
            else:
                kwargs['response_format'] = response_format


            return self.client.beta.chat.completions.parse(model=self.model, messages=messages,
                                                       temperature=self.temperature,
                                                       **kwargs)
        else:
            return self.client.chat.completions.create(model=self.model, messages=messages, temperature=self.temperature, max_completion_tokens=self.max_new_tokens, **kwargs)

    def _get_result_content(self, response_by_api):
        if self.api_type == 'ollama':
            return response_by_api['message']['content']

        return response_by_api.choices[-1].message.content

    def chat(self, text):
        message = {"role": "user", "content": text}
        self.history.append(message)

        result = self.send_messages(self.history)

        result_content = self._get_result_content(result)

        self.history.append({"role": "assistant", "content": result_content})

        return result_content

    def chat_without_history(self, text, **kwargs):
        message = [{"role": "user", "content": text}]
        result = self.send_messages(message, **kwargs)
        result_content = self._get_result_content(result)

        return result_content

    def to_dict(self):
        return {
            'url': self.url,
            'api_key': self.api_key,
            'model': self.model,
            'history': self.history,
            'api_type': self.api_type,
        }


class API_Manager:
    def __init__(self, save_path=None):
        '''
        用来管理不同的历史记录
        '''
        self.apis = {}
        self.save_path = save_path

    def add_api(self, id, api: OpenAI_API):
        if id in self.apis:
            return False
        else:
            self.apis[id] = api
            return True

    def set_save_path(self, path):
        self.save_path = path

    def save(self):
        apis_status = {}
        for id, api in self.apis.items():
            apis_status[id] = api.to_dict()

        assert self.save_path is not None, 'save path is None'
        json.dump(apis_status, open(self.save_path, 'w', encoding='utf-8'), indent=5)
        return self

    def load(self):
        assert self.save_path is not None, 'save path is None'
        apis_status = json.load(open(self.save_path, 'r', encoding='utf-8'))
        for id, api_stat in apis_status.items():
            self.apis[id] = OpenAI_API(**api_stat)
        return self

    def get_api_by_id(self, id):
        if id not in self.apis:
            return None
        return self.apis[id]
