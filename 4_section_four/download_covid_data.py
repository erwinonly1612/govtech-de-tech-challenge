import pandas as pd
import requests
import json

covid_sg_json = requests.get("https://api.covid19api.com/country/singapore?from=2020-03-01T00:00:00Z&to=2022-07-24T00:00:00Z").json()
covid_sg_df = pd.json_normalize(covid_sg_json, max_level=1)
covid_sg_df.head()
covid_sg_df.info()