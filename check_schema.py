import psycopg2
from src.db_utils.db_utils import db_config

try:
    conn = psycopg2.connect(dbname='postgres', **db_config)
    cur = conn.cursor()
    
    # 修正的SQL查询
    cur.execute("""
        SELECT schema_name 
        FROM information_schema.schemata 
        WHERE schema_name NOT IN ('information_schema', 'pg_catalog', 'pg_toast', 'public')
    """)
    
    schemas = cur.fetchall()
    print('找到的schema:', [s[0] for s in schemas])
    
    # 同时检查是否有cmt_denormalized这个schema
    cur.execute("""
        SELECT schema_name 
        FROM information_schema.schemata 
        WHERE schema_name = 'cmt_denormalized'
    """)
    
    cmt_result = cur.fetchall()
    if cmt_result:
        print('✅ 找到cmt_denormalized schema')
        
        # 检查这个schema下的表
        cur.execute("""
            SELECT table_name 
            FROM information_schema.tables 
            WHERE table_schema = 'cmt_denormalized'
        """)
        tables = cur.fetchall()
        print(f'cmt_denormalized schema中有 {len(tables)} 个表')
        print('前5个表:', [t[0] for t in tables[:5]])
        
    else:
        print('❌ 未找到cmt_denormalized schema')
    
    cur.close()
    conn.close()
    
except Exception as e:
    print('检查schema失败:', e)
