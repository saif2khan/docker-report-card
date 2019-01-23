DELETE FROM metabase.apt;

LOAD DATA LOCAL INFILE  'clean_data/apt_all.csv' into table metabase.apt
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;