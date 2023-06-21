import sqlalchemy as alch # python -m pip install --upgrade 'sqlalchemy<2.0'
import pandas as pd
import pymysql 

def la_conexion (dbName):
    password = "password"
    connectionData=f"mysql+pymysql://root:{password}@localhost/{dbName}"
    engine = alch.create_engine(connectionData)
    return engine
