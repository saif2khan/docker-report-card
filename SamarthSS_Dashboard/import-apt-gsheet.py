import pandas as pd
from io import BytesIO
import requests

r = requests.get('https://docs.google.com/spreadsheets/d/1dadyFbXBI0K6XAp4xkDEBGfmzG6waGk9CJARgFcDocc/export?format=csv')
data = r.content
df = pd.read_csv(BytesIO(data),parse_dates=['Month of State Review Meeting','Expected Date of response','Date when step was taken by District official','Review date'])

#To replace 2nd row as header
#df.columns = df.iloc[0]
#df = df[1:]


#df["Month of State Review Meeting"] = df["Month of State Review Meeting"].dt.strftime('%Y/%m/%d')
#df["Month of State Review Meeting"] = pd.to_datetime(df["Month of State Review Meeting"])

df.to_csv("export.csv", encoding='utf-8', index=False)

#print(list(df))
#print(df.to_string())