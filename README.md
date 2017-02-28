# unix-shell
Shell script to validate data file
filterCSV.sh 12012011 12012010 10chmod 755 filterCSV.sh ---> you can do anything; others can only read and execute
ps -ef | grep pmoncat data.csv | rev | cut -d, -f-5 | revrev reverses the lines, so it doesn't matter if all the rows have the same number of columns, it will always remove the last 4. This only works if the last 4 columns don't contain any commas themselves.

**********************To RUN THE SCRIPT**********************
1. time SIT_processCSV.sh 06022001 06012001 33  - Filter data from csv file on column 33 for date between Jun 01, 2001 and June 02, 2001
2. SIT_connectDB.sh -  To connect DB and fetch data in csv format
3. diff SIT_filterData.txt SIT_DB_data.txt - To find diff between filtered data from step 1 and database data from step 2
