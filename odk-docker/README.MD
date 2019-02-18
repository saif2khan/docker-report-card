Before running application for the first time, prepare the database container with:

`docker-compose run --rm db`

Press ctrl+c when you see the message "PostgreSQL init process complete; ready for start up"

Start Aggregate and Metabase with:

`docker-compose up`

Access Aggregate at http://localhost:8080

Aggregate username:administrator password:aggregate

Set up enketo web form by going to Site Admin > Preferences and click on change Enketo API Configuration. 
API URL: http://139.59.94.126:8005/api/v2 Key: samagra  You can now fill a web form by going to Form Management> Enketo 

Access Metabase at http://localhost:3000

Metabase Host:db Port:5432 Database:aggregate User:aggregate Password:aggregate

Check your response by going to Ask A Question and selecting the appropriate table
