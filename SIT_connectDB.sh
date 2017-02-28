export PATH=/oracle/11.2/11.2.0.3/bin:$PATH
export ORACLE_HOME=/oracle/11.2/11.2.0.3
#set linesize 9999
sqlplus -s username/password#@(DESCRIPTION =(ADDRESS_LIST =(ADDRESS = (PROTOCOL = TCP)(HOST = hostname)(PORT = 1810)))(CONNECT_DATA =(SERVER = DEDICATED)(SERVICE_NAME = IDDDEV))) << EOF
set pagesize 0
set feedback off
set heading off 
set echo off
set serveroutput off
set linesize 32767
SET TRIMSPOOL ON
SET TERMOUT OFFSET COLSEP ","
set numw 20
spool query_output.txt
ALTER SESSION SET  NLS_DATE_FORMAT = "MM/DD/YYYY hh24:mi:ss";
START SIT_query.sql spool off;
exitEOFawk -F, '/,/{gsub(/ /, "", $0); print} ' query_output.txt > file1.txt
#To sort the file
sort -T . -t, -nk1 file1.txt > SIT_DB_data.txt
rm file1.txt
rm query_output.txt
