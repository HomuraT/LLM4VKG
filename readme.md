# LLM4VKG: Leveraging Large Language Models for Virtual Knowledge Graph Construction

LLM4VKG is a framework that leverages Large Language Models (LLMs) for Virtual Knowledge Graph (VKG) construction. By integrating established mapping patterns, LLM4VKG effectively structures and maps ontologies, making them more comprehensive and practical. Additionally, we developed an automated evaluation framework to simplify the assessment process.

# Requirements

Please refer to the `requirements.txt` file for a list of dependencies.

# Resources

ontop: [https://github.com/ontop/ontop](https://github.com/ontop/ontop)

logmap: [https://github.com/ernestojimenezruiz/logmap-matcher](https://github.com/ernestojimenezruiz/logmap-matcher)

The following external resources are required. Please download and place them in the `./resources` directory:

# Prepare for Run

1. Instantiate the database according to the SQL dump file in `./datasets/rodi/*/dump.sql`. And then set the corresponding DB config in `src/db_utils/db_utils.py`.
2. Set api config for LLMs in `src/llm/resources/ampi.json`.

# How to Run

1. mapping pattern recognition: `python MPR.py`
2. ontology completion and mapping generation: `python OC_MG.py`
3. evaluate: `python rodi_evaluate.py`

# Results

The directory `outputs/` will contain the full outputs of LLM4VKG. This includes the generated ontology, mappings, and a comprehensive evaluation report detailing performance metrics and validation outcomes.

# Acknowledgements

This work utilizes the RODI (Relational-to-Ontology Mapping Quality Benchmark) dataset. We thank the creators and maintainers for their contribution.

The RODI benchmark can be found at: [https://github.com/chrpin/rodi](https://github.com/chrpin/rodi)

# Citation

If you find this work useful, please consider citing our paper accepted at IJCAI 2025:

```bibtex
@inproceedings{Xiao2025LLM4VKG,
  author    = {Guohui Xiao and Lin Ren and Guilin Qi and Haohan Xue and Marco Di Panfilo and Davide Lanti},
  title     = {LLM4VKG: Leveraging Large Language Models for Virtual Knowledge Graph Construction},
  booktitle = {Proceedings of the 34th International Joint Conference on Artificial Intelligence (IJCAI-25)},
  year      = {2025}
}
```
