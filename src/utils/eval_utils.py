import os
import json

from src.dataset_utils.dataset import get_dataset

def get_overall_datasets():
    datasets = {}

    fnames = {
        'random_str_symbolic',
        'random_word_symbolic',
        'related_word_symbolic',
        'random_str_language',
        'random_word_language',
        'related_word_language',
    }
    for fname in fnames:
        dataset = get_dataset('TriBooleanQuerying', fname)
        datasets[fname] = dataset
    return datasets



def get_datasets_normal_eval(path_base='datasets/normal_eval'):
    datasets = {}
    for fname in os.listdir(path_base):
        if not fname.endswith('.jsonl'):
            continue
        dname = fname.split('.')[0]
        dataset = get_dataset('TriBooleanQueryingSubset', os.path.join(path_base, fname))
        datasets[dname] = dataset
    return datasets


def get_nm_symbolic_dataset():
    path_base = 'datasets/nm_dataset'
    datasets = {}
    fnames = {
        'random_str_symbolic',
        'random_word_symbolic',
        'related_word_symbolic',
    }
    for fname in fnames:
        with open(os.path.join(path_base, fname + '.jsonl'), 'r') as f:
            dataset = [json.loads(line) for line in f]
        datasets[fname] = dataset
    return datasets

def get_predictions_by_eval_mode(mode='normal_eval/TriBooleanQuerying'):
    path_base = os.path.join('predictions', mode)
    predictions = {}
    for model_name in os.listdir(path_base):
        print(model_name)
        if model_name.startswith('.'):
            continue

        model_predictions = {}
        model_p_path = os.path.join(path_base, model_name)
        for fname in os.listdir(model_p_path):
            if not fname.endswith('.jsonl'):
                continue
            dname = fname.split('.')[0]
            ps = []
            with open(os.path.join(model_p_path, fname), 'r') as f:
                for line in f:
                    if line.strip():
                        ps.append(json.loads(line))
            model_predictions[dname] = ps
        predictions[model_name] = model_predictions
    return predictions
