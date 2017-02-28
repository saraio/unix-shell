#Please comment the below line after first run for each file - To remove the spaces
awk -F, '/,/{gsub(/ /, "", $0); print} ' customercoverage_ods.csv  > SIT_formatedData.txt 
awk -F"," -v myvar="$1 $2" -v colnum="$3" '
{
split($colnum,a,"\/")
cpm_one=substr(a[3],1,4)
cpm_two=substr("'$1'",5,4)
cpm_three=substr("'$2'",5,4)
#{print NF}
#{print $33}
if(NF=="63")
{
if(cpm_one >= cpm_two &&  cpm_one <= cpm_three)
{
#{print $33}
callfunc="SIT_datefunction.sh "myvar " " a[1]a[2]substr(a[3],1,4);
v=system(callfunc);
#{print callfunc}
if(v=="0")
{
#{print NF}
{print}
}# v=0
}#year range
}#NF-CustomerCoverage
}#begin
' SIT_formatedData.txt  > file1.txt
#To remove last 2 columns
awk -F',' '{for(i = 1; i <= NF - 2; i++) printf("%s%s", $i, i == NF - 2 ? "\n" : OFS)}' OFS="," file1.txt > file2.txt
#To sort file
sort -T . -t, -nk1 file2.txt > SIT_filterData.txt
rm file1.txt
rm file2.txt
