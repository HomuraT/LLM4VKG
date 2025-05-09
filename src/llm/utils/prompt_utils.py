import json


class Prompt_hepler:
    def __init__(self):
        self.history = []

    def clear_history(self):
        self.history.clear()

    def _add_content(self, text, role):
        self.history.append({'role': role, 'content': str(text)})

    def add_user_content(self, text):
        self._add_content(text, 'user')

    def add_assistent_content(self, text):
        self._add_content(text, 'assistant')

    def get_prompt(self):
        return self.history

    def build_with_list(self, contents):
        '''
        会先清除历史

        :param contents:
        :return:
        '''

        self.clear_history()

        for index, content in enumerate(contents):
            if index % 2 == 0:
                # 偶数，user
                self.add_user_content(content)
            else:
                # 奇数，assistant
                self.add_assistent_content(content)

        return self.get_prompt()

    def replace_special_token(self, text: str, prefix, suffix, key, target):
        '''
        替换 前缀+key+后缀为target

        :param prefix:
        :param suffix:
        :param key:
        :param target:
        :return:
        '''
        flag = prefix + key + suffix

        return text.replace(str(flag), str(target))

    def replace_with_dict(self, text: str, kv_dict: dict, prefix, suffix):
        for k, v in kv_dict.items():
            text = self.replace_special_token(text, prefix, suffix, k, v)

        return text


def load_prompt(prompt_path, prompt_id):
    prompts = json.load(open(prompt_path, 'r', encoding='utf-8'))
    return prompts[prompt_id]
