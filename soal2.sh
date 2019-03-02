#2a
echo "----nomor 1----"
awk -F, '{if($7 == "2012") i[$1]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR == 1 {print $2,$3}'

#2b
echo "----nomor 2----"
awk -F, '{if($1 == "United States" && $7 == "2012") i[$4]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3}'

#2c
echo "----nomor 3----"
awk -F, '{if($1 == "United States" && $7 == "2012" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) i[$6]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'

