import pymysql
import sqlalchemy as alch # python -m pip install --upgrade 'sqlalchemy<2.0'
from getpass import getpass
import pandas as pd

def connection_sql (dbName):
    connectionData=f"mysql+pymysql://root:{password}@localhost/{dbName}"
    engine = alch.create_engine(connectionData)
    return engine