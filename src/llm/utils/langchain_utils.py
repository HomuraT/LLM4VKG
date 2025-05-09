import copy
from types import MethodType
from typing import List
from typing import Optional, Any

from langchain.llms.base import LLM
from langchain_core.output_parsers import JsonOutputParser
from langchain_core.prompts import PromptTemplate
from pydantic import Field, PrivateAttr, BaseModel

from src.llm.utils.gpt_utils import API_Manager


class CustomLLM(LLM):
    api_url: Optional[str] = Field(None, exclude=True)  # api_url 初始化为空
    api_key: Optional[str] = Field(None, exclude=True)  # api_key 初始化为空
    _api_tool: Optional[object] = PrivateAttr()  # 使用 PrivateAttr 定义私有属性
    response_format: Optional[str] = Field(None, exclude=True)  # response_format 初始化为空

    api_id: str  # 这是你传入的唯一参数

    class Config:
        arbitrary_types_allowed = True  # 允许任意类型

    def __init__(self, **kwargs: Any):
        super().__init__(**kwargs)  # 先调用父类初始化
        # 初始化 api_tool
        self._api_tool = API_Manager('src/llm/resources/ampi.json').load().get_api_by_id(self.api_id)
        # 设置 api_url 和 api_key
        self.api_url = self._api_tool.url
        self.api_key = self._api_tool.api_key


    def _call(self, prompt: str, stop: Optional[List[str]] = None, **kwargs) -> str:
        response = self._api_tool.chat_without_history(prompt, response_format=self.response_format)
        return response

    @property
    def _identifying_params(self) -> dict:
        return {"api_url": self.api_url}

    @property
    def _llm_type(self) -> str:
        return self.api_id

class Modules:
    def __init__(self, modules_json, prompts, set_all_api_id=None):
        self.modules_json = modules_json
        self.prompts = prompts
        self.set_all_api_id = set_all_api_id
        if self.set_all_api_id is not None:
            print(f"Set all api id to {self.set_all_api_id}")

        self._api_tool = API_Manager('src/llm/resources/ampi.json').load()

        self.modules = {}
        self.init_attrs = {}
        self.build_modules()

    def get_module(self, module_id):
        if module_id in self.modules:
            return self.modules[module_id]
        else:
            raise ValueError(f"Module {module_id} not found")

    def build_modules(self):
        for op_id, curr_op in self.modules_json['modules'].items():
            op_type = curr_op['type']
            if op_type == 'prompt':
                cur_op_object = PromptTemplate(
                    input_variables=self.prompts[curr_op['id']]['vars'],
                    partial_variables=self.prompts[curr_op['id']]['partial_vars'] if 'partial_vars' in self.prompts[curr_op['id']] else {},
                    template=self.prompts[curr_op['id']]['content'],
                    template_format="mustache" if "template_format" not in curr_op else curr_op['template_format'],
                )
            elif op_type == 'llm':

                api_id = self.set_all_api_id
                if "forced_api_id" in curr_op:
                    api_id = curr_op["forced_api_id"]

                if not api_id:
                    raise ValueError(f"No api_id found for {op_id}")
                cur_op_object = CustomLLM(api_id=api_id, response_format=curr_op['response_format'])
            elif op_type == 'parser':
                cur_op_object = JsonOutputParser()
            elif op_type == 'operation':
                operation_dict = {
                    'stack': self._stack_dict,
                    'concat_str': self._concat_str,
                    'fuse_dicts': self._fuse_dicts,
                    'concat_dicts': self._concat_dicts
                }
                cur_op_object = operation_dict[curr_op['name']]
            elif op_type == 'attr':
                self.init_attrs[op_id] = curr_op['value']
            else:
                raise ValueError(f"Unknown operation type: {op_type}")

            self.modules[op_id] = cur_op_object

        if 'chains' in self.modules_json:
            for chain in self.modules_json['chains']:
                cname = chain['name']
                self.modules[cname] = chain

    def _stack_dict(self, names:list[str], args:list[dict], params:dict=None):
        stacked_dict = {}
        for name, arg in zip(names, args):
            stacked_dict[name] = arg

        return stacked_dict

    def _concat_dicts(self, names:list[str], args:list[dict], params:dict=None):
        concated_dict = {**args[0]}
        for key in params['concat_name']:
            if key not in concated_dict:
                concated_dict[key] = ''
            for arg in args[1:]:
                if key in arg:
                    concated_dict[key] = f"{arg[key]}{params['concat_sep']}" + concated_dict[key]

        return concated_dict

    def _concat_str(self, names:list[str], args:list[dict], params:dict=None):
        result = args[0]
        concated_str = ''
        for i, pname in enumerate(params['concat_name']):
            sep = params['concat_sep']
            if type(sep) is list:
                sep = sep[i]

            concated_str += f"{sep}{result[pname]}"
        if len(params['concat_sep']) > len(params['concat_name']):
            # edd tail sep
            concated_str += params['concat_sep'][-1]
        result[params['output_name']] = concated_str
        return result

    def _fuse_dicts(self, names:list[str], args:list[dict], params:dict=None):
        fused_dict = {**args[0]}
        # args[0] is the result of past step, so we need to put it at the end
        args = args[1:] + [args[0]]
        fused_all_dict = {k: v for d in args for k, v in d.items()}

        for arg in args:
            if params is None:
                fused_dict.update(arg)
            else:
                assert "fuse_key" in params, "fuse_key is not specified"
                for key in params['fuse_key']:
                    if type(key) is str and key in arg:
                        fused_dict[key] = arg[key]
                    elif type(key) is list:
                        msg = ''
                        for k in key:
                            if k.startswith('{{') and k.endswith('}}'):
                                # attr
                                attr_k = k[2:-2]

                                if attr_k == 'past_reasoning_path':
                                    pass

                                if attr_k in fused_all_dict:
                                    msg += str(fused_all_dict[attr_k])
                            elif k.startswith('@@') and k.endswith('@@'):
                                # out key
                                fused_dict[k[2:-2]] = msg
                            else:
                                # normal str
                                msg += k

        return fused_dict

    def run(self, input_data, return_result_dict=False, return_overall_msg=False):
        result_dict = {
            None: input_data,
            **self.init_attrs
        }

        overall_msg = []
        current_result = None

        def run_chain(_chain, chain_input):
            max_loop = 1
            if "loop" in _chain:
                max_loop = _chain['loop']['out_condition']['max_loop']

            current_result = chain_input
            for i in range(max_loop):
                for op in _chain['chain']:
                    if type(op) is dict:
                        # operation
                        operation = op['operation']
                        if operation == 'if-else':
                            conditions = op['conditions']
                            tmp_result = result_dict[op['input']]
                            assert tmp_result is not None, "current_result is None"
                            flag = True
                            for k, v in conditions.items():
                                if tmp_result[k] != v:
                                    flag = False
                            if flag:
                                op = op['T']
                            else:
                                op = op['F']
                            if op is None:
                                continue
                        elif operation == 'save_to':
                            assert "attr_name" in op, "attr_name is not in op"

                            if "selected_key" not in op:
                                result_dict[op["attr_name"]] = current_result
                            else:
                                tmp_result = {}
                                for k in op["selected_key"]:
                                    tmp_result[k] = current_result[k]
                                result_dict[op["attr_name"]].update(tmp_result)
                            continue
                        elif operation == 'update_dict':
                            dict_names = op['dict_name']
                            init_dict = result_dict[dict_names[0]]
                            for k in op['key']:
                                for d in dict_names[1:]:
                                    if k in result_dict[d]:
                                        init_dict[k] = result_dict[d][k]
                            result_dict[op['output_name']] = init_dict
                            continue

                    if type(self.modules[op]) is dict:
                        # chain
                        past_result = current_result
                        if type(op) is str:
                            if op.startswith("chain"):
                                if self.modules[op]['input'] in result_dict:
                                    past_result = result_dict[self.modules[op]['input']]
                        current_result = run_chain(self.modules[op], past_result)
                    elif isinstance(self.modules[op], MethodType):
                        # func, need to gain params from _chain
                        input_names = ["input"]
                        input_args = [current_result]

                        if "input_other" in _chain:
                            input_names += _chain['input_other']
                            input_args += [result_dict[name] if name in result_dict else {} for name in _chain['input_other']]

                        params = None
                        if "params" in _chain:
                            params = _chain['params']

                        current_result = self.modules[op](input_names, input_args, params)
                    else:
                        current_result = self.modules[op].invoke(current_result)
                    overall_msg.append((op, copy.deepcopy(current_result)))
                    if "chain" in op:
                        # only chain has output_name
                        if "output_name" in self.modules[op]:
                            result_dict[self.modules[op]['output_name']] = current_result
                if "loop" in _chain:
                    out_condition = _chain['loop']['out_condition']
                    for k, v in out_condition.items():
                        if k in current_result:
                            if current_result[k] == v:
                                return current_result
            return current_result


        for chain_name in self.strategy['run_chain']:
            chain = self.modules[chain_name]
            chain_input = result_dict[chain['input']]

            current_result = run_chain(chain, chain_input)
            result_dict[chain['output_name']] = current_result

        if return_result_dict or return_overall_msg:
            if not return_result_dict:
                result_dict = None
            if not return_overall_msg:
                overall_msg = None
            return current_result, result_dict, overall_msg
        return current_result

def set_response_format(llm:LLM, model:BaseModel)->None:
    llm.response_format = model