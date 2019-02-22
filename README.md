# Soal Shift Modul1 F02
Jawaban dan Penjelasan Praktikum Modul 1 Sistem Operasi 2019.

## Soal 1

```
#!/bin/bash

unzip /home/rye/sisop/nature.zip -d /home/rye/sisop
```
* berfungsi untuk meng-unzip file nature.zip yang terletak pada direktori /home/rye/sisop

```
mkdir /home/rye/sisop/nature_decrypted
```
* membuat direktori bernama nature_decrypted di dalam direktori /home/rye/sisop/

```
i="1"
```
* menginisialisasi variabel i = 1

```
for photo in /home/rye/sisop/nature/*.jpg
do
```
* untuk setiap file pada direktore nature yang berekstensi .jpg, lakukan ..

```
base64
```
* mengganti biner menjadi berbasis 64

```
-d $photo
```
* Decode file photo di folder nature

```
| xxd -r 
```
* mengembalikan file hexadecimal menjadi file biner

```
> /home/rye/sisop/nature_decrypted/$i.jpg
```
* Output yang didapat diletakkan pada direktori nature_decrypted

```
i=$(($i + 1))
```
* melakukan perulangan pada setiap file berekstensi .jpg di folder nature

```
done
```
* proses perulangan selesai

#### CRONTAB

```
#nomor 1
14 14 14 2 * /bin/bash /home/rye/sisop/soal1.sh
```
* At 14:14 on day-of-month 14 in February.

```
#14 14 * 2 5 /bin/bash /home/rye/sisop/soal1.sh
```
* At 14:14 on Friday in February

## Soal 2
```
#2a

echo "----nomor 1----"

awk -F, '{if($7 == "2012") i[$1]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR == 1 {print $2,$3}'
```
* Pada setiap field, jika pada kolom ke-7 (tahun) = 2012, maka ..
* setiap isi di dalam kolom ke-1 (negara) yang sama maka tambahkan nilai pada kolom ke-10 (Quantity).
* Jika x terdapat dalam tabel i, maka print i[x] (Quantity) dan x (Negara).
* File bernama WA_Sales_Products_2012-14.csv
* Urutkan dari kuantiti terbanyak 
* Pilih record yang paling atas (kuantiti terbesar) 
* Cetak kolom ke-2 dan ke-3 dari hasil record tersebut.

```
#2b

echo "----nomor 2----"

awk -F, '{if($1 == "United States" && $7 == "2012") i[$4]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3}'
```
* Pada setiap field, jika kolom ke-1 (nama negara) dan kolom ke-7 (tahun) = 2012, maka ..
* Setiap nilai di dalam kolom ke-10 (Quantity) dengan isi kolom ke-4 (product line) yang sama akan dijumlah. 
* Kemudian print i[x] (Quantity) dan x(product line).
* File bernama WA_Sales_Products_2012-14.csv
* Urutkan dari kuantiti terbanyak 
* Pilih 3 record teratas (terbanyak)
* Cetak kolom ke-2 dan ke-3 (Product Line) dari hasil record tersebut.

```
#2c

echo "----nomor 3----"

echo "--Personal Accessories: "

awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Personal Accessories") i[$6]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'
```
* Pada setiap field, jika kolom ke-1 (nama negara) = “United States” dan kolom ke-7 (tahun) = 2012 dan kolom ke-4 (Product Line) = "Personal Accessories", maka ..
* Setiap nilai di dalam kolom ke-10 (Quantity) dengan isi kolom ke-6 (Product) yang sama akan dijumlahkan.
* Kemudian print i[x] (Quantity) dan x (Product).
* File bernama WA_Sales_Products_2012-14.csv.
* Urutkan dari kuantiti terbanyak.
* Pilih 3 record teratas (terbanyak).
* Cetak kolom ke-2, ke-3, dan ke-4 (Product) dari hasil record tersebut.

```
echo "--Camping Equipment: "
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Camping Equipment") i[$6]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'
```
* Pada setiap field, jika kolom ke-1 (nama negara) = “United States” dan kolom ke-7 (tahun) = 2012 dan kolom ke-4 (Product Line) = "Camping Equipment", maka ..
* Setiap nilai di dalam kolom ke-10 (Quantity) dengan isi kolom ke-6 (Product) yang sama akan dijumlahkan.
* Kemudian print i[x] (Quantity) dan x (Product).
* File bernama WA_Sales_Products_2012-14.csv.
* Urutkan dari kuantiti terbanyak.
* Pilih 3 record teratas (terbanyak).
* Cetak kolom ke-2, ke-3, dan ke-4 (Product) dari hasil record tersebut.

```
echo "--Outdoor Protection: "
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Outdoor Protection") i[$6]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'
```
* Pada setiap field, jika kolom ke-1 (nama negara) = “United States” dan kolom ke-7 (tahun) = 2012 dan kolom ke-4 (Product Line) = "Outdoor Protection", maka ..
* Setiap nilai di dalam kolom ke-10 (Quantity) dengan isi kolom ke-6 (Product) yang sama akan dijumlahkan.
* Kemudian print i[x] (Quantity) dan x (Product).
* File bernama WA_Sales_Products_2012-14.csv.
* Urutkan dari kuantiti terbanyak.
* Pilih 3 record teratas (terbanyak).
* Cetak kolom ke-2, ke-3, dan ke-4 (Product) dari hasil record tersebut.

## Soal 3
```
#!/bin/bash

i=1
j=1
ord=1
password=string
value=string
```
* Inisialisasi i = 1, j = 1, ord = 1, password = string, value = string .
```
while [ $i -ne 0 ]
do
        if [[ -f /home/rye/sisop/nomor3/password$ord.txt ]] 
        then
                ord=$(($ord + 1))
```
* Dilakukan pengecekan pada folder /home/rye/sisop/nomor3. 
* Jika pada folder tersebut terdapat file bernama password$ord.txt (contoh : password1.txt), maka ord += 1. 
```
        else
                while [ $j -ne 0 ]
                do
                        password="$(dd if=/dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)"
                        kcl=0
                        bsr=0
                        angka=0
                        k=0
                        leng=${#password}
```                        
* Jika pada folder /home/rye/sisop/nomor3 tidak terdapat file bernama password$ord.txt (contoh : password1.txt), maka ..
* Membuat password baru yang terdiri dari :
        <br><li> Huruf a-z, A-Z, dan angka 0-9.
        <br><li> Tersusun atas 12 susunan karakter.
        <br><li> Terdapat dalam 1 baris.
```
                        while [ $k -lt $leng ]

                        do
                                if [[ "${password:$k:1}" == [A-Z] ]]
                                        then
                                        bsr=$(($bsr + 1));
                                        fi
                                if [[ "${password:$k:1}" == [a-z] ]]
                                        then
                                        kcl=$(($kcl + 1));
                                        fi
                                if [[ "${password:$k:1}" == [0-9] ]]
                                        then
                                        angka=$(($angka + 1));
                                        fi
                        k=$(($k+1))
                        done
                        if [ $bsr -gt 0 ] && [ $kcl -gt 0 ] && [ $angka -gt 0 ]
                        then
                                l=1
                                count1=0
                                count2=0
                                for item2 in /home/rye/sisop/nomor3/*
                                do
                                        value=$(<$item2)
                                        if test "$value" = "$password"
                                        then
                                                break
                                        fi
                                        let count1=$count1+1
                                done

                                for item in /home/rye/sisop/nomor3/*
                                do
                                        let count2=$count2+1
                                done
                                if [[ $count1 -le $count2 ]]
                                then
                                        i=0
                                        #echo $password
                                        #echo $count1
                                        #echo $count2
                                        echo "$password" > /home/rye/sisop/nomor3/password$ord.txt
                                        j=0

                                fi
                        fi

                done
        fi
done
```

## Soal 5
```
SCRIPT
awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF < 13 {print}' >> /home/rye/sisop/modul1/syslogsoal5.log
```
* Menyeleksi dari folder /var/log/syslog yang mengandung kata “cron” atau “CRON”, dan tidak mengandung kata “sudo”.
* Dari hasil seleksi tersebut, diprint 12 hasil teratas.
* Kemudian hasil tersebut diappend dalam file syslogsoal5.log dalam folder /home/rye/sisop/modul1/.

#### CRONTAB
```
#nomor 5
#2-30/6 * * * * /bin/bash /home/rye/sisop/soal5.sh
```
* At every 6th minute from 2 through 30.
