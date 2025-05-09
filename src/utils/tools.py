import json
import os
import random
import re
import string
import threading
import time
from datetime import datetime
from typing import Literal

import numpy as np


def generate_ramdom_sequence(k: int, useLetters=True, useNumber=True) -> str:
    select_set = []
    if useLetters:
        select_set += string.ascii_letters
    if useNumber:
        select_set += string.digits

    return ''.join(random.choices(select_set, k=k))


# save jsonl obj



def get_handled_result(api, ph, data, prompt, error_extraction_count, handle_result4LLM=None):
    handled_result = None
    for _ in range(error_extraction_count):
        msg = ph.replace_with_dict(prompt['content'], data, '{', '}')
        try:
            llm_result = api.chat_without_history(msg)
        except Exception as e:
            print('error:', e)
            time.sleep(3)
            continue
        if handle_result4LLM:
            handled_result = handle_result4LLM(llm_result, data, prompt)
        else:
            handled_result = llm_result
        if handled_result:
            break
    return handled_result


def simply_re_search(pattern, text, flag):
    match = re.search(pattern, text, flag)
    if match:
        return match.group(1)
    return None


def random_TF(p):
    return random.random() < p


def random_add_str(str, p):
    return str if random_TF(p) else ''

def are_sets_connected(sets):
    parent = {}

    def find(x):
        if parent[x] != x:
            parent[x] = find(parent[x])
        return parent[x]

    def union(x, y):
        rootX = find(x)
        rootY = find(y)
        if rootX != rootY:
            parent[rootY] = rootX

    # 初始化每个元素的父节点
    for s in sets:
        for item in s:
            if item not in parent:
                parent[item] = item

    # 合并集合中的元素
    for s in sets:
        first_item = s[0]
        for item in s[1:]:
            union(first_item, item)

    # 找到所有集合的根节点
    roots = set(find(item) for item in parent)

    # 如果根节点只有一个，说明所有集合是连通的
    return len(roots) == 1

def find(parent, x):
    if parent[x] != x:
        parent[x] = find(parent, parent[x])
    return parent[x]

def union(parent, rank, x, y):
    rootX = find(parent, x)
    rootY = find(parent, y)
    if rootX != rootY:
        if rank[rootX] > rank[rootY]:
            parent[rootX] = rootY
        elif rank[rootX] < rank[rootY]:
            parent[rootY] = rootX
        else:
            parent[rootY] = rootX
            rank[rootX] += 1

def modify_sets_to_connect(sets):
    parent = {}
    rank = {}

    # 初始化每个元素的父节点和秩(rank)
    for s in sets:
        for item in s:
            if item not in parent:
                parent[item] = item
                rank[item] = 0

    # 合并集合中的元素
    for s in sets:
        first_item = s[0]
        for item in s[1:]:
            union(parent, rank, first_item, item)

    # 找到所有集合的根节点
    roots = set(find(parent, item) for item in parent)
    root_list = sorted(list(roots))  # 按元素大小排序根节点

    # 修改集合中的元素以连接所有集合
    for i in range(1, len(root_list)):
        root = root_list[i]
        for s in sets:
            if find(parent, s[0]) == root:
                smallest_root = root_list[0]
                s[0] = smallest_root
                for item in s[1:]:
                    union(parent, rank, s[0], item)
                break

    return sets


def set_random_seed(seed):
    random.seed(seed)
    np.random.seed(seed)


def cmd_helper(base_str, zip_attr_names:list=None, zip_attr_values:list=None, for_attr_dict:dict=None):
    '''


    :param base_str:
    :param zip_attr_names: [x1, x2, x3]
    :param zip_attr_values: [[v11, v12, v13], [v21, v22, v23]]
    :param for_attr_dict: {x1: {v1, v2}, x2:{v1, v2}}
    :return:
    '''
    if type(base_str) is list:
        results = []
        for bs in base_str:
            results += cmd_helper(bs, zip_attr_names, zip_attr_values, for_attr_dict)
        return results

    target_cmds = []

    zip_cmds = []
    if zip_attr_names:
        assert len(zip_attr_values) > 0, 'zip_attr_values is empty'
        for zavs in zip_attr_values:
            assert len(zavs) == len(zip_attr_names), 'zavs can not be aligned to zip_attr_names'
            zcmd = ''
            for zname, zvalue in zip(zip_attr_names, zavs):
                zcmd += f' {zname} {zvalue}'
            zip_cmds.append(zcmd)

    for_cmds = None
    if for_attr_dict:
        for k, v in for_attr_dict.items():
            if for_cmds is None:
                for_cmds = [f' {k} {vv}' for vv in v]
            else:
                for_cmds_new = []
                for vv in v:
                    for fcmd in for_cmds:
                        for_cmds_new.append(fcmd + f' {k} {vv}')
                for_cmds = for_cmds_new

    if zip_cmds:
        for zcmd in zip_cmds:
            target_cmds.append(base_str + zcmd)

    if for_cmds:
        if len(target_cmds) == 0:
            target_cmds = [base_str]

        new_target_cmds = []
        for fcmd in for_cmds:
            for tcmd in target_cmds:
                new_target_cmds.append(tcmd + fcmd)
        target_cmds = new_target_cmds

    return target_cmds

def load_jsonl(file_path):
    with open(file_path, 'r') as f:
        return [json.loads(line) for line in f]

def save_jsonl(objs: list[dict], path: str):
    if not os.path.exists(os.path.dirname(path)):
        os.makedirs(os.path.dirname(path))
    with open(path, 'w') as f:
        for item in objs:
            f.write(json.dumps(item) + '\n')

def get_current_time():
    # 获取当前时间并格式化为字符串
    return datetime.now().strftime("%Y%m%d-%H%M%S")

def create_literal_from_list(values: list[str]) -> Literal:
    return Literal.__getitem__(tuple(values))


def load_json_file(file_path):
    """Utility function to load a JSON file."""
    with open(file_path, 'r') as file:
        return json.load(file)

def run_with_timeout(func, timeout, *args, **kwargs):
    result = [None]
    def wrapper():
        result[0] = func(*args, **kwargs)
    thread = threading.Thread(target=wrapper)
    thread.daemon = True
    thread.start()
    thread.join(timeout)
    return result[0]