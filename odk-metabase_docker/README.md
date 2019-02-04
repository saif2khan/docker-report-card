**Before running application for the first time, prepare the database container with:**

`docker-compose run --rm db`

Press ctrl+c when you see the message "PostgreSQL init process complete; ready for start up"

**Start Aggregate and Metabase with:**

`docker-compose up`

Access Aggregate at http://localhost:8080
Aggregate username:administrator password:aggregate

Access Metabase at http://localhost:3000
Metabase Host:db Port:5432 Database:aggregate User:aggregate Password:aggregate