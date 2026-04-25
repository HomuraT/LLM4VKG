# LLM4VKG: Leveraging Large Language Models for Virtual Knowledge Graph Construction

LLM4VKG is a framework that leverages Large Language Models (LLMs) for Virtual Knowledge Graph (VKG) construction. By integrating established mapping patterns, LLM4VKG structures and maps ontologies in a more comprehensive and practical way. The project also includes an automated evaluation framework for end-to-end assessment.

## Installation

### Install UV

First, install UV, a fast Python package installer and resolver.

Using pip:
```bash
pip install uv
```

Using curl (Linux/macOS):
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Using Homebrew (macOS):
```bash
brew install uv
```

More installation options: [https://github.com/astral-sh/uv](https://github.com/astral-sh/uv)

### Install dependencies

```bash
uv sync
```

This creates a virtual environment and installs all dependencies from `pyproject.toml`.

## Requirements

Please refer to `pyproject.toml` for the full dependency list.

## External resources

This project depends on the following external tools.

### Ontop

LLM4VKG currently uses **Ontop 5.4.0**.

From the repository root, install it with:

```bash
mkdir -p resources
cd resources

curl -L -o ontop-cli-5.4.0.zip   https://github.com/ontop/ontop/releases/download/ontop-5.4.0/ontop-cli-5.4.0.zip

mkdir -p ontop
unzip ontop-cli-5.4.0.zip -d ontop

chmod +x ontop/ontop
rm -f ontop-cli-5.4.0.zip

cd ..
```

After installation, the following file should exist:

```bash
resources/ontop/ontop
```

### LogMap

LLM4VKG currently uses **LogMap matcher 4.0**.

Requirements for building LogMap:

- Java 8 or newer
- Maven
- Git

From the repository root, install it with:

```bash
mkdir -p resources
cd resources
git clone https://github.com/ernestojimenezruiz/logmap-matcher.git logmap
cd logmap
mvn -Dmaven.compiler.source=1.8 -Dmaven.compiler.target=1.8 -DskipTests package
cd ../..
```

After installation, the following files should exist:

```bash
resources/logmap/target/logmap-matcher-4.0.jar
resources/logmap/target/parameters.txt
resources/logmap/target/java-dependencies
```

## Configuration

Runtime configuration is centralized in `config.py`.

Typical settings include:

- PostgreSQL connection settings
- enabled subsets
- enabled LLM APIs
- model settings such as embedding model, RAG model, device, and temperature
- optional PostgreSQL client binary paths

Create a local environment file from the example template:

```bash
cp .env.example .env
```

Then open `.env` and put your own credentials there. For example:

```bash
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_postgres_password
YUNWU_API_KEY=your_yunwu_key
ANTHROPIC_API_KEY=your_anthropic_key
```

## Database setup

The project expects the RODI dumps under `./datasets/rodi/*/dump.sql`.

You can either load the dumps into PostgreSQL manually or use Docker.

### Option 1: load dumps with Python

```bash
uv run python load_postgres_dumps.py
```

This creates one database per dataset folder and imports the corresponding `dump.sql`.

### Option 2: run PostgreSQL 11 with Docker

The repository includes a Docker-based setup for PostgreSQL 11 that imports all RODI dumps automatically on first startup.

Use the helper script:

```bash
./script/run_docker_postgres.sh
```

This script builds the Docker image, starts the PostgreSQL container, and waits until the database is ready to accept host-side SQL connections.

## How to run

All convenience scripts are located in `script/`.

Make sure they are executable:

```bash
chmod +x script/*.sh
```

### One-time setup

To install Python dependencies, Ontop, and LogMap automatically, run:

```bash
./script/bootstrap.sh
```

### Step-by-step

1. Start PostgreSQL with Docker:
   ```bash
   ./script/run_docker_postgres.sh
   ```

2. Mapping pattern recognition:
   ```bash
   ./script/MPR.sh
   ```

3. Ontology completion and mapping generation:
   ```bash
   ./script/OC_MG.sh
   ```

4. Evaluation:
   ```bash
   ./script/rodi_evaluate.sh
   ```

### End-to-end

To run the full pipeline, use the combined script:

```bash
./script/run_all.sh
```

This runs:

1. Docker PostgreSQL startup
2. mapping pattern recognition
3. ontology completion and mapping generation
4. evaluation

## Outputs

The `outputs/` directory contains the generated artifacts, including:

- generated ontology files
- generated mappings
- evaluation results
- detailed metrics reports

## Notes

- LLM API definitions are configured through `config.py`.
- Secrets such as API keys and database passwords should be provided through `.env`.
- If you use Docker for PostgreSQL initialization, the import scripts run only on first initialization of the data directory.

## Acknowledgements

This work uses the RODI (Relational-to-Ontology Mapping Quality Benchmark) dataset. We thank the creators and maintainers for their contribution.

RODI benchmark: [https://github.com/chrpin/rodi](https://github.com/chrpin/rodi)

## Citation

If you find this work useful, please consider citing our IJCAI 2025 paper:

```bibtex
@inproceedings{Xiao2025LLM4VKG,
  author    = {Guohui Xiao and Lin Ren and Guilin Qi and Haohan Xue and Marco Di Panfilo and Davide Lanti},
  title     = {LLM4VKG: Leveraging Large Language Models for Virtual Knowledge Graph Construction},
  booktitle = {Proceedings of the 34th International Joint Conference on Artificial Intelligence (IJCAI-25)},
  year      = {2025}
}
```
