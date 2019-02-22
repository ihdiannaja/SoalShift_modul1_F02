#!/bin/bash

key=`echo $1 | awk -F: '{print $1}'`
key=`echo "$key" | bc`
#echo $key

kiri1=$((122-$key))
kiri1=$(($kiri1+1))
if [ $kiri1 -gt 122 ]
then
    kiri1=97
fi
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
kiri2=$((90-$key))
kiri2=$(($kiri2+1))
if [ $kiri2 -gt 90 ]
then
    kiri2=65
fi
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
hour=`echo $1 | awk -F: '{print $1}'`
minute=`echo $1 | awk '{print $1}' | awk -F: '{print $2}'`
datee=`echo $1 | awk '{print $2}' | awk -F- '{print $1}'`
month=`echo $1 | awk '{print $2}' | awk -F- '{print $2}'`
year=`echo $1 | awk '{print $2}' | awk -F- '{print $3}' | awk -F. '{print $1}'`

cat "$hour:$minute $datee-$month-$year".txt | tr [a-z] ["$kiri1"-za-"$kanan1"] | tr [A-Z] ["$kiri2"-ZA-"$kanan2"] > "$hour:$minute $datee-$month-$year-asli".txt
