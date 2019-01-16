# importing pandas and re module  
import pandas as pd 
import re
    
# reading csv file 
data = pd.read_csv("raw_data.csv",parse_dates=['InspectionDate'],dayfirst=True)

data.dropna(inplace = True) 

def clean_cce():
	
	#filter cce data
	global data_cce
	data_cce = data[data.Question.str.contains(r'^Enter')]

	#splitting out integer values from observation column 
	new_obs_cce = data_cce["Observation"].str.split(".", n = 1, expand = True)
	data_cce["Question_cce"]= new_obs_cce[0]
	
	#Splitting out hindi values
	new_ques_cce = data_cce["Question_cce"].str.split("/", n = 1, expand = True)
	
	#extracting subject name from question column
	data_cce["Question_subject"] = data_cce.Question.str[66:69]

	#Creating new question column and appending subject to it
	data_cce["Question_Eng"]= new_ques_cce[0] + data_cce["Question_subject"]

	#Creating new observation column
	data_cce["Observation_Eng"]= new_obs_cce[1]
	
	#deleting original columns
	data_cce.drop(columns = ["Question","Observation","Question_cce","Question_subject"], inplace = True)

def clean_rest():
	
	#filter out cce data
	global data_rest 
	data_rest = data[~data.Question.str.contains(r'^Enter')]

	#splitting out hindi values from question and observation columns 
	new_ques = data_rest["Question"].str.split("/", n = 1, expand = True)
	data_rest["Question_Eng"]= new_ques[0] 

	new_obs = data_rest["Observation"].str.split("/", n = 1, expand = True)
	data_rest["Observation_Eng"]= new_obs[0]

	#deleting original columns
	data_rest.drop(columns = ["Observation", "Question"], inplace = True)

clean_cce()
clean_rest()

data_combined = data_cce.append(data_rest, ignore_index=True)

#changing date format

data_combined["InspectionDate"] = data_combined["InspectionDate"].dt.strftime('%Y/%m/%d')
data_combined["InspectionDate"] = pd.to_datetime(data_combined["InspectionDate"])

#exporting to new csv
data_combined.to_csv("final_output_data_clean.csv", encoding='utf-8',index=False)


