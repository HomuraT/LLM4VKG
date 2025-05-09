# LLM4VKG: Leveraging Large Language Models for Virtual Knowledge Graph Construction

In this work, we propose LLM4VKG, a framework that leverages LLMs for  VKG construction. By integrating established mapping patterns, LLM4VKG effectively structures and maps ontologies, making them more comprehensive and practical. Additionally, we developed an automated evaluation framework to simplify the assessment process.

# Requirements
```text
torch==2.4.1
tqdm
sentence_transformers==3.3.0
rdflib
psycopg2
```

# Resources
ontop: https://github.com/ontop/ontop

logmap: https://github.com/ernestojimenezruiz/logmap-matcher

Download the above resources and place them in the corresponding directory of `./resources`

# Prepare for Run
1. Instantiate the database according to the SQL dump file in `./datasets/rodi/*/dump.sql`. And then set the corresponding DB config in `src/db_utils/db_utils.py`.
2. Set api config for LLMs in `src/llm/resources/ampi.json`.

# How to Run
1. mapping pattern recognition: `python MPR.py`
2. ontology completion and mapping generation: `python OC_MG.py`
3. evaluate: `python rodi_evaluate`

# Results
The directory `outputs/rodi_LLM4VKG_gpt_4o` contains the full outputs of LLM4VKG, comprising the generated ontology, mappings, and a comprehensive evaluation report detailing performance metrics and validation outcomes.