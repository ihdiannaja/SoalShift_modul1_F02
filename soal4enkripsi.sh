#!/bin/bash

key=`date "+%H"`
key=`echo "$key" | bc`

kiri1=$(($key+97))
kiri1=$(printf \\$(printf '%03o' $kiri1))
#echo $kiri1
kanan1=$(printf '%d' "'$kiri1")
kanan1=$(($kanan1-1))
if [ $kanan1 -lt 97 ]
then
    kanan1=122
fi
kanan1=$(printf \\$(printf '%03o' $kanan1))
#echo $kanan1
kiri2=$(($key+65))
kiri2=$(printf \\$(printf '%03o' $kiri2))
#echo $kiri2
kanan2=$(printf '%d' "'$kiri2")
kanan2=$(($kanan2-1))
if [ $kanan2 -lt 65 ]
then
    kanan2=90
fi
kanan2=$(printf \\$(printf '%03o' $kanan2))
#echo $kanan2

hour=`date "+%H"`
#echo $hour
minute=`date "+%M"`
#echo $minute
datee=`date "+%d"`
#echo $dates
month=`date "+%m"`
#echo $month
year=`date "+%Y"`
#echo $year

cat /var/log/syslog | tr [a-z] ["$kiri1"-za-"$kanan1"] | tr [A-Z] ["$kiri2"-ZA-"$kanan2"] > "/home/rye/sisop/$hour:$minute $datee-$month-$year".txt

