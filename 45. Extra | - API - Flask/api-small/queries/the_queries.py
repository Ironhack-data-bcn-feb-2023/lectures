import tools.sql_connection as conn
import pandas as pd

def get_everything (table, limit):
    engine = conn.la_conexion("employees")
    query = f"""SELECT * FROM  {table} LIMIT {limit};"""
    df = pd.read_sql_query(query, engine)
    return df

def insert_into_table (table, dict_):
    engine = conn.la_conexion("employees")

    emp_no = dict_["emp_no"]
    birth_date = dict_["birth_date"]
    first_name = dict_["first_name"]
    last_name = dict_["last_name"]
    gender = dict_["gender"]
    hire_date = dict_["hire_date"]

    query = f"""INSERT INTO {table} VALUES ('{emp_no}', '{birth_date}', '{first_name}', '{last_name}', '{gender}', '{hire_date}');"""
    engine.execute(query)
    return "Inserted!"