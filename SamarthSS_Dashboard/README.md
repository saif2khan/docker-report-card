1. Copy paste raw csv to folder raw_data by typing and entering on your terminal "scp -r /your/file/address/export_latest.csv samarth@159.89.174.185:/home/samarth/ssa_data/raw_data". Put your file address after -r. Name of file should be export_latest.csv

2. In your terminal login to the server by entering "ssh samarth@159.89.174.185" 

3. Type and enter "cd ssa_data" to move to ssa_data directory

4. Type and enter "sudo python3 cleanData.py". Enter password "shimla" when prompted

5. Type and enter "sudo mysql -uroot -ppassword metabase < insertData.sql"
