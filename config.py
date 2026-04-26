import os
from dotenv import load_dotenv

load_dotenv()

db_config = {
    "host": "localhost",
    "user": os.getenv("POSTGRES_USER", "postgres"),
    "password": os.getenv("POSTGRES_PASSWORD"),
    "port": int(os.getenv("POSTGRES_PORT", "5433")),
}

subset_names = [
    "rodi",
]

postgres_bins = {
    "createdb": "/opt/homebrew/opt/libpq/bin/createdb",
    "psql": "/opt/homebrew/opt/libpq/bin/psql",
}

model_config = {
    "device": "cuda",
    "sentence_transformer_model": "BAAI/bge-m3",
    "rag_model": "all-MiniLM-L6-v2",
    "temperature": 0,
}

SENTENCE_TRANSFORMERS_CACHE = None

llm_apis = {
    # "gpt_4o_mini": {
    #     "url": "https://yunwu.ai/v1",
    #     "api_key": os.getenv("YUNWU_API_KEY"),
    #     "model": "gpt-4o-mini",
    #     "history": [],
    # },
    # "gpt_4o": {
    #     "url": "https://yunwu.ai/v1",
    #     "api_key": os.getenv("YUNWU_API_KEY"),
    #     "model": "gpt-4o",
    #     "history": [],
    # },
    # "gpt_5": {
    #     "url": "https://yunwu.ai/v1",
    #     "api_key": os.getenv("YUNWU_API_KEY"),
    #     "model": "gpt-5",
    #     "history": [],
    # },
    # "gemini_2.5_pro": {
    #     "url": "https://yunwu.ai/v1",
    #     "api_key": os.getenv("YUNWU_API_KEY"),
    #     "model": "gemini-2.5-pro",
    #     "history": [],
    # },
    # "gpt_5_pro": {
    #     "url": "https://yunwu.ai/v1",
    #     "api_key": os.getenv("YUNWU_API_KEY"),
    #     "model": "gpt-5-pro",
    #     "history": [],
    # },
    # "claude-sonnet-4-6": {
    #     "url": "https://api.anthropic.com/v1",
    #     "api_key": os.getenv("ANTHROPIC_API_KEY"),
    #     "model": "claude-sonnet-4-6",
    #     "history": [],
    # },
    # "claude-opus-4-1-20250805": {
    #     "url": "https://api.anthropic.com/v1",
    #     "api_key": os.getenv("ANTHROPIC_API_KEY"),
    #     "model": "claude-opus-4-1-20250805",
    #     "history": [],
    # },
    "ollama_hpc_cluster_deepseek_r1_32b": {
        "url": "http://localhost:5000/api/chat",
        "api_key": "ollama",
        "api_type": "ollama",
        "model": "deepseek-r1:32b",
        "history": [],
    }
}
