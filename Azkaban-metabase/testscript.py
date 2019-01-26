import pandas as pd
from io import BytesIO
import requests

r = requests.get('https://docs.google.com/spreadsheets/d/1dadyFbXBI0K6XAp4xkDEBGfmzG6waGk9CJARgFcDocc/export?format=csv')
data = r.content
df = pd.read_csv(BytesIO(data))


df.to_csv("export.csv", encoding='utf-8', index=False)