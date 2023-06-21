from tools.mysql_connection import connection_sql
import pandas as pd


def query_employees (table):

    engine_employees = connection_sql("employees")
    query = f"""SELECT * FROM {table}"""
    return pd.read_sql_query(query, engine_employees)


