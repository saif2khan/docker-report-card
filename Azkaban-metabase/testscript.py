import pandas as pd
from io import BytesIO
import requests
import sqlalchemy

r = requests.get('https://docs.google.com/spreadsheets/d/1dadyFbXBI0K6XAp4xkDEBGfmzG6waGk9CJARgFcDocc/export?format=csv')
data = r.content
df = pd.read_csv(BytesIO(data))


df.to_csv("export.csv", encoding='utf-8', index=False)

database_username = 'azkaban'
database_password = 'password'
database_ip       = '139.59.71.154'
database_name     = 'foo'
database_connection = sqlalchemy.create_engine('mysql+mysqlconnector://{0}:{1}@{2}/{3}'.
format(database_username, database_password, database_ip, database_name))
df.to_sql(con=database_connection, name='apttest', if_exists='replace')