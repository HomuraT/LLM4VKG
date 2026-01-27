# LLM4VKG: Leveraging Large Language Models for Virtual Knowledge Graph Construction

LLM4VKG is a framework that leverages Large Language Models (LLMs) for Virtual Knowledge Graph (VKG) construction. By integrating established mapping patterns, LLM4VKG effectively structures and maps ontologies, making them more comprehensive and practical. Additionally, we developed an automated evaluation framework to simplify the assessment process.

## Installation

### Install UV

First, install UV (a fast Python package installer and resolver). You can install it using one of the following methods:

**Using pip:**
```bash
pip install uv
```

**Using curl (Linux/macOS):**
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**Using Homebrew (macOS):**
```bash
brew install uv
```

For more installation options, visit: https://github.com/astral-sh/uv

### Install Dependencies

After installing UV, install the project dependencies:

```bash
uv sync
```

This will create a virtual environment and install all dependencies specified in `pyproject.toml`.

## Requirements

Please refer to the `pyproject.toml` file for a list of dependencies.

## Resources

The following external resources are required. Please download and place them in the `./resources` directory:

- **ontop**: [https://github.com/ontop/ontop](https://github.com/ontop/ontop)
- **logmap**: [https://github.com/ernestojimenezruiz/logmap-matcher](https://github.com/ernestojimenezruiz/logmap-matcher)

## Prepare for Run

1. Instantiate the database according to the SQL dump file in `./datasets/rodi/*/dump.sql`. And then set the corresponding DB config in `src/db_utils/db_utils.py`.
2. Set API config for LLMs in `src/llm/resources/ampi.json`.

## How to Run

All scripts are located in the `script/` directory and use UV to run the Python programs. Make sure you have completed the installation steps above before running.

1. **Mapping pattern recognition**: 
   ```bash
   ./script/MPR.sh
   ```

2. **Ontology completion and mapping generation**: 
   ```bash
   ./script/OC_MG.sh
   ```

3. **Evaluate**: 
   ```bash
   uv run python rodi_evaluate.py
   ```

### Alternative Scripts

- `script/MPR_infk.sh` / `script/MPR_nofk.sh`: Mapping pattern recognition with different configurations
- `script/OC_MG_infk.sh` / `script/OC_MG_nofk.sh`: Ontology completion and mapping generation with different configurations
- `script/dataEnrichment.sh`: Data enrichment script

**Note**: Make sure the scripts have execute permissions. If not, run:
```bash
chmod +x script/*.sh
```

## Results

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
