DELETE from metabase.temptable;

LOAD DATA LOCAL INFILE  'clean_data/export_latest_clean.csv' into table metabase.temptable
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

INSERT INTO metabase.shikshaSaathi (SELECT * FROM metabase.temptable);
