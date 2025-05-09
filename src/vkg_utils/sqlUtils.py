import yaml
import pymysql
import psycopg2
from contextlib import contextmanager

class DatabaseManager:
    def __init__(self, config, database_name=None):
        self.db_type = config['db_type'].lower()  # 数据库类型 (mysql 或 postgresql)
        self.database_name = database_name or config.get('database')
        self.connection = self._connect(config)

    def _connect(self, config):
        """根据配置文件连接到指定的数据库"""
        if self.db_type == 'mysql':
            return pymysql.connect(
                host=config['host'],
                user=config['user'],
                password=config['password'],
                database=self.database_name,
                port=config.get('port', 3306),
                charset='utf8'
            )
        elif self.db_type == 'postgresql':
            return psycopg2.connect(
                host=config['host'],
                user=config['user'],
                password=config['password'],
                dbname=self.database_name,
                port=config.get('port', 5432)
            )
        else:
            raise ValueError("Unsupported database type. Use 'mysql' or 'postgresql'.")

    @contextmanager
    def cursor(self):
        """上下文管理器，用于自动管理游标和异常处理"""
        cursor = self.connection.cursor()
        try:
            yield cursor
        finally:
            cursor.close()

    def get_tables(self):
        """获取数据库中的所有表"""
        with self.cursor() as cursor:
            if self.db_type == 'mysql':
                cursor.execute("SHOW TABLES")
            elif self.db_type == 'postgresql':
                cursor.execute("""
                    SELECT table_name
                    FROM information_schema.tables
                    WHERE table_schema = 'public'
                """)
            return [row[0] for row in cursor.fetchall()]

    def get_table_columns(self, table_name):
        """获取指定表的列名和类型"""
        with self.cursor() as cursor:
            if self.db_type == 'mysql':
                cursor.execute(f"SHOW COLUMNS FROM `{table_name}`")
                return [(col[0], col[1]) for col in cursor.fetchall()]
            elif self.db_type == 'postgresql':
                cursor.execute(f"""
                    SELECT column_name, data_type
                    FROM information_schema.columns
                    WHERE table_name = %s
                """, (table_name,))
                return [(col[0], col[1]) for col in cursor.fetchall()]

    def close_connection(self):
        """关闭数据库连接"""
        if self.connection:
            self.connection.close()

class Table:
    def __init__(self, name):
        self.name = name
        self.columns = []

    def add_column(self, name, col_type):
        self.columns.append({'name': name, 'type': col_type})

    def __str__(self):
        columns_info = "\n".join([f"  Column: {col['name']}, Type: {col['type']}" for col in self.columns])
        return f"Table: {self.name}\n{columns_info}"

def load_config_from_yaml(yaml_path):
    """从 YAML 配置文件加载数据库配置"""
    with open(yaml_path, 'r') as file:
        return yaml.safe_load(file)

def get_tables_from_db(yaml_path, database_name=None):
    """获取数据库中的表及其结构"""
    config = load_config_from_yaml(yaml_path)
    db_manager = DatabaseManager(config, database_name)
    table_objects = []

    try:
        tables = db_manager.get_tables()
        for table_name in tables:
            table_obj = Table(table_name)
            columns = db_manager.get_table_columns(table_name)
            for column in columns:
                table_obj.add_column(column[0], column[1])
            table_objects.append(table_obj)
    finally:
        db_manager.close_connection()

    return table_objects
