import requests
import csv, json
import time

csvUserFilePath = "testUser.csv" # User data file path
csvScopeFilePath = "testScope.csv" # Scope data file path
csvScopeMappingFilePath = "testScopeMappingActual_Schemes_remaining.csv" # User-Scope mapping file path

data = {}

# main api url
url = 'http://164.100.141.221:8080/api/v1'

# put your username/password here
auth = ('adapt', 'callSIMBA@100only')

#importing User data
'''with open(csvUserFilePath, encoding='utf-8-sig') as csvFile:
	csvReader = csv.DictReader(csvFile)
	for csvRow in csvReader:
		response = requests.post(url + '/users', data=csvRow, 
		auth=auth, verify=False)
		print(json.dumps(csvRow,indent=4))
		time.sleep(1)

print(response.url) 
print(response.json()) 

#importing Scope data
with open(csvScopeFilePath, encoding='utf-8-sig') as csvFile:
	csvReader = csv.DictReader(csvFile)
	for csvRow in csvReader:
		response = requests.post(url + '/scopes', data=csvRow, 
		auth=auth, verify=False)
		print(json.dumps(csvRow,indent=4))
		time.sleep(1)

print(response.url)
print(response.json())
'''
#importing User Scope Mapping data
with open(csvScopeMappingFilePath, encoding='utf-8-sig') as csvFile:
	csvReader = csv.DictReader(csvFile)
	for csvRow in csvReader:
		response = requests.post(url + '/userScopeMappings', data=csvRow, 
		auth=auth, verify=False)
		print(json.dumps(csvRow,indent=4))
		print(response.url)
		print(response.json())
		time.sleep(1)


#print(response.url)
#print(response.json())
