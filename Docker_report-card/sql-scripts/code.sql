CREATE TABLE hindi (
name VARCHAR(25),
score INT
);

CREATE TABLE maths (
name VARCHAR(25),
score INT
);

LOAD DATA LOCAL INFILE  '/var/lib/mysql-files/hindi.csv' into table hindi
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE  '/var/lib/mysql-files/maths.csv' into table maths
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r' 
IGNORE 1 LINES;

set @sql = concat("SELECT hindi.name as name,(hindi.score+maths.score) 
as total_score from hindi join maths on hindi.name = maths.name 
INTO OUTFILE '/var/lib/mysql-files/reportcard_",NOW(),".csv' 
FIELDS ENCLOSED BY '"' TERMINATED BY ';'
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n'");
PREPARE s1 FROM @sql;
EXECUTE s1;
DROP PREPARE s1;

