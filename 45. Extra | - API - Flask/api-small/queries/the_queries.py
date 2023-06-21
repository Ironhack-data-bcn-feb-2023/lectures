import tools.sql_connection as conn
import pandas as pd

def get_everything (table, limit):
    engine = conn.la_conexion("employees")
    query = f"""SELECT * FROM  {table} LIMIT {limit};"""
    df = pd.read_sql_query(query, engine)
    return df