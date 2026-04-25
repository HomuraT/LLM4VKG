from pathlib import Path
import os
import shutil
import subprocess

from config import db_config, subset_names, postgres_bins


def find_bin(name: str, configured_path: str | None = None, env_var: str | None = None) -> str:
    if configured_path:
        return configured_path
    if env_var and os.environ.get(env_var):
        return os.environ[env_var]
    found = shutil.which(name)
    if found:
        return found
    extra = f" or set {env_var}" if env_var else ""
    raise FileNotFoundError(f"Could not find '{name}' on PATH{extra}.")


def iter_dump_files():
    for subset in subset_names:
        yield from Path(f"datasets/{subset}").glob("*/dump.sql")


def create_database(createdb_bin: str, env: dict, db_name: str):
    result = subprocess.run(
        [createdb_bin, "-h", db_config["host"], "-p", str(db_config["port"]), "-U", db_config["user"], db_name],
        env=env,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        text=True,
    )
    if result.returncode != 0:
        print(f"Database {db_name} already exists")
    else:
        print(f"Created database: {db_name}")


def import_dump(psql_bin: str, env: dict, db_name: str, dump_path: Path):
    print(f"Importing {dump_path} into {db_name}")
    subprocess.run(
        [
            psql_bin,
            "-v", "ON_ERROR_STOP=1",
            "-h", db_config["host"],
            "-p", str(db_config["port"]),
            "-U", db_config["user"],
            "-d", db_name,
            "-f", str(dump_path),
        ],
        env=env,
        check=True,
        text=True,
    )


def main():
    createdb_bin = find_bin("createdb", postgres_bins.get("createdb"), "CREATEDB_BIN")
    psql_bin = find_bin("psql", postgres_bins.get("psql"), "PSQL_BIN")

    env = os.environ.copy()
    env["PGPASSWORD"] = db_config["password"]

    dumps = list(iter_dump_files())
    if not dumps:
        print("No dump.sql files found.")
        return

    for dump_path in dumps:
        db_name = dump_path.parent.name
        create_database(createdb_bin, env, db_name)
        import_dump(psql_bin, env, db_name, dump_path)

    print("All dumps imported into separate databases.")


if __name__ == "__main__":
    main()
