import psycopg2

# for postgres
db_config = {
    "host": "",
    "user": "",
    "password": "",
    "port": "",
}

def get_all_databases(user, password, host, port):
    db_list = []  # 用于存储所有数据库名称

    try:
        # 连接到 PostgreSQL 数据库（连接到默认的 postgres 数据库）
        conn = psycopg2.connect(
            dbname='postgres',  # 使用 postgres 数据库来查询所有数据库
            user=user,
            password=password,
            host=host,
            port=port
        )

        # 创建一个游标对象
        cur = conn.cursor()

        # 查询所有数据库名（排除模板数据库）
        cur.execute("""
            SELECT datname
            FROM pg_database
            WHERE datname NOT IN ('template0', 'template1', 'postgres');
        """)

        # 获取所有数据库的名称
        db_list = cur.fetchall()

        # 提取数据库名称并存储为列表
        db_list = [db[0] for db in db_list]

        # 关闭游标和连接
        cur.close()
        conn.close()

    except Exception as e:
        print(f"Error: {e}")

    return db_list

def get_table_structure(dbname, user, password, host, port, db_schema=None):
    if db_schema is None:
        db_schema = dbname

    table_info = {}  # 用于存储所有表格的结构信息

    conn = psycopg2.connect(
        dbname=dbname,
        user=user,
        password=password,
        host=host,
        port=port
    )

    # 创建一个游标对象
    cur = conn.cursor()

    # 获取数据库中的所有表（包括 schema 名称）
    cur.execute(query="""
        SELECT table_schema, table_name
        FROM information_schema.tables
        WHERE table_schema = %s;  -- 排除系统表
    """, vars=(db_schema,))

    # 获取所有表的 schema 和名称
    tables = cur.fetchall()

    if tables:
        # 遍历所有表格
        for selected_schema, selected_table in tables:
            table_structure = {
                "table_name": f"{selected_table}",
                "columns": [],
                "primary_keys": [],
                "foreign_keys": []
            }

            # 获取表的列结构
            cur.execute("""
                SELECT column_name, data_type
                FROM information_schema.columns
                WHERE table_schema = %s
                AND table_name = %s;
            """, (selected_schema, selected_table))

            columns = cur.fetchall()
            for column in columns:
                column_info = {
                    "column_name": column[0],
                    "data_type": column[1],
                    "is_primary_key": False
                }
                table_structure["columns"].append(column_info)

            # 查询主键信息
            cur.execute("""
                SELECT DISTINCT kcu.column_name
                FROM information_schema.table_constraints AS tc
                JOIN information_schema.key_column_usage AS kcu
                    ON tc.constraint_name = kcu.constraint_name
                WHERE tc.table_schema = %s
                AND tc.table_name = %s
                AND tc.constraint_type = 'PRIMARY KEY';
            """, (selected_schema, selected_table))

            primary_keys = cur.fetchall()
            for pk in primary_keys:
                # 标记主键列
                for column_info in table_structure["columns"]:
                    if column_info["column_name"] == pk[0]:
                        column_info["is_primary_key"] = True
                        table_structure["primary_keys"].append(pk[0])

            query = """
            SELECT
                -- sub.constraint_name,
                -- sub.foreign_table,
                sub.foreign_column,
                sub.referenced_table,
                sub.referenced_column,
                sub.constraint_name
            FROM (
                SELECT DISTINCT
                    tc.constraint_name,
                    tc.table_schema AS foreign_table_schema,
                    tc.table_name AS foreign_table,
                    kcu_foreign.column_name AS foreign_column,
                    kcu_referenced.table_schema AS referenced_table_schema,
                    kcu_referenced.table_name AS referenced_table,
                    kcu_referenced.column_name AS referenced_column,
                    kcu_foreign.ordinal_position
                FROM
                    information_schema.table_constraints AS tc
                    JOIN information_schema.key_column_usage AS kcu_foreign
                        ON tc.constraint_name = kcu_foreign.constraint_name
                        AND tc.table_schema = kcu_foreign.table_schema
                    JOIN information_schema.referential_constraints AS rc
                        ON tc.constraint_name = rc.constraint_name
                        AND tc.table_schema = rc.constraint_schema
                    JOIN information_schema.key_column_usage AS kcu_referenced
                        ON rc.unique_constraint_name = kcu_referenced.constraint_name
                        AND rc.unique_constraint_schema = kcu_referenced.table_schema
                        AND kcu_referenced.ordinal_position = kcu_foreign.ordinal_position
                        AND kcu_referenced.table_name = (
                            SELECT tc_ref.table_name
                            FROM information_schema.table_constraints AS tc_ref
                            WHERE tc_ref.constraint_name = rc.unique_constraint_name
                            AND tc_ref.table_schema = rc.unique_constraint_schema
                            LIMIT 1
                        )
                WHERE
                    tc.constraint_type = 'FOREIGN KEY'
                    AND kcu_foreign.table_schema = %s  -- 仅查询特定 schema 下的表
                    AND kcu_foreign.table_name = %s  -- 仅查询特定表的外键
            ) AS sub
            ORDER BY
                sub.constraint_name,
                sub.ordinal_position;
            """

            cur.execute(query, (selected_schema, selected_table))
            foreign_keys = cur.fetchall()

            for fk in foreign_keys:
                foreign_key_info = {
                    "column_name": fk[0],  # 源列
                    "foreign_table": f"{fk[1]}",  # 目标表：schema + 表名
                    "foreign_column": fk[2],  # 目标列
                    "constraint_name": fk[3]
                }

                table_structure["foreign_keys"].append(foreign_key_info)

            # 将当前表的结构添加到字典中
            table_info[f'{table_structure["table_name"]}'] = table_structure

        # 去除目标表的外键信息
        # for table, structure in table_info.items():
        #     for fk in structure["foreign_keys"]:
        #         # 从目标表中移除源表作为外键
        #         foreign_table = fk["foreign_table"]
        #         if foreign_table in table_info:
        #             table_info[foreign_table]["foreign_keys"] = [
        #                 f for f in table_info[foreign_table]["foreign_keys"] if f["foreign_table"] != table
        #             ]
    else:
        raise ValueError(f"No tables found in database {dbname}.")

    # 关闭游标和连接
    cur.close()
    conn.close()

    return table_info

if __name__ == "__main__":
    # 使用方法
    dbname = 'mondial_allconcrete_standard'
    a = get_table_structure(dbname, **db_config)

    print(get_all_databases(**db_config))
