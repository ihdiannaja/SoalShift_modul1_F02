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
        <br>    1. Huruf a-z, A-Z, dan angka 0-9.
        <br>    2. Tersusun atas 12 susunan karakter.
        <br>    3. Terdapat dalam 1 baris.
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
```
* Perulangan ini berfungsi untuk memastikan bahwa password yang telah dibuat terdiri dari huruf A-Z, a-z, dan angka 0-9.
```
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
```
* Perulangan ini berfungsi untuk melakukan pengecekan pada folder /home/rye/sisop/nomor3, apakah isi file pada folder tersebut terdapat kombinasi password yang telah dibuat atau tidak. Agar tidak terdapat duplikasi password dalam satu folder. 
```
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
* Setelah password berhasil dibuat, maka password tersebut disimpan dalam file bernama password$ord.txt .

## Soal 4
#### ENKRIPSI
```
#!/bin/bash

key=`date "+%H"`
key=`echo "$key" | bc`
```
* Inisialisasi key = date saat ini, dan hanya diambil jamnya saja.
* Mengubah string jam menjadi integer
```
kiri1=$(($key+97))
kiri1=$(printf \\$(printf '%03o' $kiri1))
#echo $kiri1
```
* `kiri1=$(($key+97))` Inisialisasi variabel kiri1 = (key) + 97 . 
* Misal sekarang adalah jam 10. Jadi kiri1 = (10) + 97 = 107 . 107 = nilai ascii dari huruf 'j' .
* Berfungsi untuk mendapatkan batas kiri dari huruf kecil 'a-z'.
```
kanan1=$(printf '%d' "'$kiri1")
kanan1=$(($kanan1-1))
        if [ $kanan1 -lt 97 ]
                then
                kanan1=122
        fi
kanan1=$(printf \\$(printf '%03o' $kanan1))
#echo $kanan1
```
* `kanan1=$(printf '%d' "'$kiri1")` Inisialisasi variabel kanan1 = kiri1 . Misal kanan1 = 107 .
* Lalu kanan1 = kanan1 - 1 . Nilai kanan1 saat ini menjadi 106 .
* Jika kanan1 < 97 , maka kanan1 = 122 . Hal ini berguna apabila kanan1 = 97 atau 'a'. 
* Berfungsi untuk mendapatkan batas kanan dari ascii huruf kecil 'a-z'.
```
kiri2=$(($key+65))
kiri2=$(printf \\$(printf '%03o' $kiri2))
#echo $kiri2
```
* Aturan di atas berlaku pula untuk mencari batas kiri dari ascii huruf kapital (A-Z).
```
kanan2=$(printf '%d' "'$kiri2")
kanan2=$(($kanan2-1))
        if [ $kanan2 -lt 65 ]
                then
                kanan2=90
        fi
kanan2=$(printf \\$(printf '%03o' $kanan2))
#echo $kanan2
```
* Aturan ini berlaku juga untuk mencari batas kanan dari ascii huruf kapital (A-Z).
```
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
```
* Berfungsi untuk mendapatkan jam, menit, tanggal, bulan, dan tahun saat ini.
```
cat /var/log/syslog | tr [a-z] ["$kiri1"-za-"$kanan1"] | tr [A-Z] ["$kiri2"-ZA-"$kanan2"] > "/home/rye/sisop/$hour:$minute $datee-$month-$year".txt
```
* Hasil yang telah dienkripsi disimpan dalam folder /home/rye/sisop/ dan nama file dengan format jam:menit:tanggal:bulan:tahun.txt . 
#### DEKRIPSI
```
#!/bin/bash

key=`echo $1 | awk -F: '{print $1}'`
key=`echo "$key" | bc`
#echo $key
```
* Berfungsi untuk mendapatkan format jam dari nama file dan mengubah tipe datanya ke dalam bentuk integer . Misal didapatkan key = 10.
```
key=$(($key-1))
#echo $key
kiri1=$((122-$key))
        if [ $kiri1 -gt 122 ]
                then
                kiri1=97
        fi
kiri1=$(printf \\$(printf '%03o' $kiri1))
#echo $kiri1
```
* `key=$(($key-1))` Inisialisasi key = key -1 . Maka nilai key = 9 .
* `kiri1=$((122-$key))` Inisialisasi kiri1 = 122 - (key) . Maka kiri1 = 122 - 9 = 113 .
* Jika nilai kiri1 < 122 , maka nilai kiri1 diset menjadi 97 .
* Berfungsi untuk mendapatkan batas kiri dari ascii huruf kecil 'a-z' .
```
kanan1=$(printf '%d' "'$kiri1")
kanan1=$(($kanan1-1))
        if [ $kanan1 -lt 97 ]
                then
                kanan1=122
        fi
kanan1=$(printf \\$(printf '%03o' $kanan1))
#echo $kanan1
```
* `kanan1=$(printf '%d' "'$kiri1")` Inisialisasi kanan1 = kiri1 . Sebagai contoh, kanan1 = 113 .
* `kanan1=$(($kanan1-1))` Inisialisasi kanan1 -= 1 . Maka kanan1 = 112 .
* Jika kanan1 bernilai < 97 . Maka di set menjadi 122 .
* Berfungsi untuk mendapatkan batas kanan dari ascii huruf kecil 'a-z'.
```
kiri2=$((90-$key))
        if [ $kiri2 -gt 90 ]
                then
                kiri2=65
        fi
kiri2=$(printf \\$(printf '%03o' $kiri2))
#echo $kiri2
```
* Aturan di atas berlaku pula untuk mencari batas kiri dari ascii huruf kapital (A-Z).
```
kanan2=$(printf '%d' "'$kiri2")
kanan2=$(($kanan2-1))
        if [ $kanan2 -lt 65 ]
                then
                kanan2=90
        fi
kanan2=$(printf \\$(printf '%03o' $kanan2))
#echo $kanan2
```
* Aturan di atas berlaku juga untuk mencari batas kanan dari ascii huruf kapital (A-Z).
```
hour=`echo $1 | awk -F: '{print $1}'`
minute=`echo $1 | awk '{print $1}' | awk -F: '{print $2}'`
datee=`echo $1 | awk '{print $2}' | awk -F- '{print $1}'`
month=`echo $1 | awk '{print $2}' | awk -F- '{print $2}'`
year=`echo $1 | awk '{print $2}' | awk -F- '{print $3}' | awk -F. '{print $1}'`
```
* Berfungsi untuk mendapatkan jam, menit, tanggal, bulan, dan tahun berdasarkan nama file asal.
```
cat "$hour:$minute $datee-$month-$year".txt | tr [a-z] ["$kiri1"-za-"$kanan1"] | tr [A-Z] ["$kiri2"-ZA-"$kanan2"] > "$hour:$minute $datee-$month-$year-asli".txt
```
* Hasil yang telah dienkripsi disimpan dalam folder /home/rye/sisop/ dan nama file dengan format jam:menit:tanggal:bulan:tahun.txt .

```CRONTAB 4 bubu
@hourly /bin/bash /home/rye/sisop/soal4enkripsi.sh
```
* Crontab ini akan berfungsi setiap jam sekali.
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
