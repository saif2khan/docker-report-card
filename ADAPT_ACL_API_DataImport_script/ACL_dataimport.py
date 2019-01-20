import requests
import csv, json
import time

csvUserFilePath = "testUser.csv" # User data file path
csvScopeFilePath = "testScope.csv" # Scope data file path
csvScopeMappingFilePath = "testScopeMapping.csv" # User-Scope mapping file path

data = {}

# main api url
url = 'http://samagraacl.herokuapp.com/api/v1'

# put your username/password here
auth = ('root', 'admin')

#importing User data
with open(csvUserFilePath, encoding='utf-8-sig') as csvFile:
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

#importing User Scope Mapping data
with open(csvScopeMappingFilePath, encoding='utf-8-sig') as csvFile:
	csvReader = csv.DictReader(csvFile)
	for csvRow in csvReader:
		response = requests.post(url + '/userScopeMappings', data=csvRow, 
		auth=auth, verify=False)
		print(json.dumps(csvRow,indent=4))
		time.sleep(1)


print(response.url)
print(response.json())
