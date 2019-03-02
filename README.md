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
* membuat direktori bernama nature_decrypted di dalam direktori /home/rye/sisop/ yang nanti akan digunakan untuk menampung file yang telah didekripsi.

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
base64 -d $photo
```
* mendecode file menggunakan base 64 sehingga dihasilkan file heksadesimal

```
| xxd -r 
```
* mengembalikan (reverse) file hexadecimal menjadi file biner

```
> /home/rye/sisop/nature_decrypted/$i.jpg
```
* File yang telah diproses disimpan pada direktori nature_decrypted

```
i=$(($i + 1))
```
* increment variabel i

```
done
```
* proses perulangan selesai
* berikut hasil setelah script dijalankan :
<img src="https://github.com/ihdiannaja/SoalShift_modul1_F02/blob/master/Screenshot%20from%202019-03-02%2017-13-42.png" width="600">

#### CRONTAB
* Dalam soal diminta bash script tersebut dijalankan ketika pukul 14:14 tanggal 14 Februari atau pukul 14:14 di hari Jumat pada bulan Februari. Ketikkan ``` crontab -e ``` pada terminal lalu tambahkan konfigurasi : 

```
#nomor 1
14 14 14 2 * /bin/bash /home/rye/sisop/soal1.sh
```
* At 14:14 on day-of-month 14 in February.

```
14 14 * 2 5 /bin/bash /home/rye/sisop/soal1.sh
```
* At 14:14 on Friday in February

## Soal 2
```
#2a

echo "----nomor 1----"

awk -F, '{if($7 == "2012") i[$1]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR == 1 {print $2,$3}'
```
* Pada setiap field, jika pada kolom ke-7 (tahun) = 2012, maka tambahkan nilai pada kolom ke-10 (Quantity) ketika isi di dalam kolom ke-1 (negara) sama.
* Print i[x] (Quantity) dan x (Negara).
* Proses tersebut dilakukan terhadap file bernama WA_Sales_Products_2012-14.csv
* Sort -nr digunakan untuk mengurutkan dari kuantiti terbanyak
* NR == 1 digunakan untuk memilih record yang paling atas (kuantiti terbesar)
* Cetak kolom ke-2 dan ke-3 dari hasil record tersebut.

```
#2b

echo "----nomor 2----"

awk -F, '{if($1 == "United States" && $7 == "2012") i[$4]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3}'
```
* Pada setiap field, jika kolom ke-1 (nama negara) adalah United States dan kolom ke-7 (tahun) = 2012, maka tambahkan nilai pada kolom ke-10 (Quantity) ketika isi di dalam kolom ke-4 (product line) sama.
* Print i[x] (Quantity) dan x (Negara).
* Proses tersebut dilakukan terhadap file bernama WA_Sales_Products_2012-14.csv
* Sort -nr digunakan untuk mengurutkan dari kuantiti terbanyak
* NR <= 3 digunakan untuk memilih 3 record yang paling atas (kuantiti terbesar)
* Cetak kolom ke-2 dan ke-3 (product line) dari hasil record tersebut.

```
#2c

echo "----nomor 3----"

echo "--Personal Accessories: "

awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) i[$6]+=$10} END {for(x in i) {print i[x],x}}' WA_Sales_Products_2012-14.csv | sort -nr | awk 'NR <= 3 {print $2,$3,$4}'
```
* Pada setiap field, jika kolom ke-1 (nama negara) adalah United States, kolom ke-7 (tahun) adalah 2012, dan kolom ke-4 (product line) adalah Personal Accessories, Camping Equipment, Outdoor Protection, maka tambahkan nilai pada kolom ke-10 (Quantity) ketika isi di dalam kolom ke-6 (product) sama.
* Kemudian print i[x] (Quantity) dan x(product).
* Proses tersebut dilakukan terhadap file bernama WA_Sales_Products_2012-14.csv
* Sort -nr digunakan untuk mengurutkan dari kuantiti terbanyak
* NR <= 3 digunakan untuk memilih 3 record yang paling atas (kuantiti terbesar)
* Cetak kolom ke-2, ke-3, dan ke-4 (Product) dari hasil record tersebut.
* berikut hasil setelah script dijalankan :
<img src="https://github.com/ihdiannaja/SoalShift_modul1_F02/blob/master/Screenshot%20from%202019-03-02%2017-16-11.png" width="600">

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
* Digunakan untuk mengecek urutan file yang terdapat pada direktori /home/rye/sisop/nomor3. Variabel ord diinisiasi bernilai 1. Lalu jika password dengan urutan tersebut telah ada pada direktori, maka variabel ord  akan ditambah 1. Begitu seterusnya sampai terdapat urutan password yang belum ada pada direktori.
```
        else
                while [ $j -ne 0 ]
                do
                        password="$(dd if=/dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)"
                        
```                        
* Setelah menentukan urutan password, langkah selanjutnya adalah membuat password. Perintah ``` tr -dc 'a-zA-Z0-9' ``` digunakan untuk membuat password dengan mengambil secara acak huruf a-z, A-Z, dan 0-9. Perintah ``` fold -w 12 ``` digunakan untuk menentukan bahwa password yang dibuat terdiri dari 12 karakter. Sedangkan perintah ``` head -n 1 ``` digunakan untuk menentukan bahwa password yang dibuat terdiri dari satu baris.
```
                        kcl=0
                        bsr=0
                        angka=0
                        k=0
                        leng=${#password}
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
* Setelah password dibuat, langkah selanjutnya adalah melakukan pengecekan untuk memastikan bahwa password yang dibuat terdiri dari huruf kecil, huruf besar, dan angka. Pengecekan dilakukan dengan menggunakan counter. Counter untuk huruf besar, huruf kecil, dan angka masing-masing diinisiasi bernilai satu. Lalu tiap huruf pada password dicek. Counter akan bertambah sesuai dengan tiap karakter pada password.
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
* Jika password telah memenuhi syarat, maka akan dilakukan proses selanjutnya. Namun jika tidak memenuhi, maka akan kembali ke perulangan untuk membuat password baru. Setelah password dipastikan terdiri dari huruf besar, huruf kecil, dan angka, dilakukan pengecekan apakah password tersebut tidak sama dengan password lainnya yang terdapat papda direktori /home/rye/sisop/nomor3. Tiap file pada direrktori tersebut ditampung nilainya pada variabel value. Lalu password yang dibuat dibandingkan dengan variabel value. Jika tidak sama, maka nilai count1 akan bertambah 1. Jika ternyata password sama dengan value, maka pengecekan akan dihentikan. Lalu dilakukan penghitungan total file pada direktori /home/rye/sisop/nomor3. Hasil penghitungan ditampung pada variabel count2. Jika nilai count1 sama dengan count2 maka dapat dipastikan password yang dibuat tidak sama dengan semua password yang terdapat pada direktori /home/rye/sisop/nomor3. Namun jika nilai count1 lebih kecil dari nilai count2 maka terdapat password yang sama sehingga akan dibuat password baru lagi.
```
                                if [[ $count1 -eq $count2 ]]
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
* Jika sudah dipastikan bahwa password memenuhi kriteria, maka password akan disimpan pada direktori /home/rye/sisop/nomor3 dengan nama file sesuai urutan password dan dengan ekstensi .txt.
* berikut hasil setelah script dijalankan :
<img src="https://github.com/ihdiannaja/SoalShift_modul1_F02/blob/master/Screenshot%20from%202019-03-02%2017-33-56.png" width="600">
<img src="https://github.com/ihdiannaja/SoalShift_modul1_F02/blob/master/Screenshot%20from%202019-03-02%2017-34-53.png" width="600">

## Soal 4
#### ENKRIPSI
```
#!/bin/bash

key=`date "+%H"`
key=`echo "$key" | bc`
```
* Inisialisasi key = date saat script dijalankan, dan hanya diambil jamnya saja.
* Mengubah string jam menjadi integer
```
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
```
* misal huruf a akan diganti dengan huruf c, maka penulisannya adalah [c-za-b]. Yang dilakukan pada script adalah mencari huruf yang dicetak tebal. Variabel kiri1 didapat dengan menambahkan nilai ASCII huruf a dengan variabel key. Sedangkan variabel kanan1 didapatkan dengan mengurangkan variabel kiri1 dengan 1. Namun ketika nilai variabel kiri1 = 97 (huruf a), maka ketika dikurangi 1 akan di set menjadi 122 (huruf z).
```
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
```
* Cara yang sama digunakan pada huruf besar.
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
* Berfungsi untuk mendapatkan jam, menit, tanggal, bulan, dan tahun saat script dijalankan.
```
cat /var/log/syslog | tr [a-z] ["$kiri1"-za-"$kanan1"] | tr [A-Z] ["$kiri2"-ZA-"$kanan2"] > "/home/rye/sisop/$hour:$minute $datee-$month-$year".txt
```
* Digunakan untuk mengenkripsi isi file /var/log/syslog dan disimpan pada dirrektori /home/rye/sisop/ dengan format nama file /$hour:$minute $datee-$month-$year.
* berikut hasil setelah script dijalankan :
<img src="https://github.com/ihdiannaja/SoalShift_modul1_F02/blob/master/Screenshot%20from%202019-03-02%2017-35-26.png" width="600">

#### DEKRIPSI
```
#!/bin/bash

key=`echo $1 | awk -F: '{print $1}'`
key=`echo "$key" | bc`
#echo $key
```
* Perintah echo $1  digunakan untuk mendapatkan judul file. Sedangkan  ``` awk -F: '{print $1}' ``` digunakan untuk mendapatkan judul file kolom pertama yaitu jam saat dibuatnya file teersebut. Nilai tersebut ditampung pada variabel key. Lalu variabel tersebut diubah menjadi integer. 
```
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
```
* Misalkan saat proses enkripsi huruf a diubah menjadi huruf c (ditambah 2). Untuk kembali ke huruf a lagi, dapat dilakukan dengan (z – key) + 1. Jika tidak ditambah 1 maka akan ke huruf z tidak ke huruf a. Jika key bernilai 0, maka nilai kiri1 akan dikembalikan menjadi huruf z.  sedangkan untuk menentukan variabel kanan1 sama seperti pada proses enkripsi.
```
kiri2=$((90-$key))
kiri2=$(($kiri+1))
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
```
* Untuk huruf besar dilakukan proses yang sama.
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
* Saat menjalankan script dekripsi, pemanggilan dilakukan dengan cara bash soal4dekripsi.sh nama_file.txt. Script diatas digunakan untuk mengambil isi file enkripsi, lalu menggeser tiap karakternya, lalu menyimpannya dengan format "$hour:$minute $datee-$month-$year-asli".txt
* Berikut hasil setelah script dijalankan :
<img src="https://github.com/ihdiannaja/SoalShift_modul1_F02/blob/master/Screenshot%20from%202019-03-02%2017-35-38.png" width="600">

#### CRONTAB 
@hourly /bin/bash /home/rye/sisop/soal4enkripsi.sh
```
* Crontab ini akan berfungsi setiap jam sekali. 01:00, 02:00, 03:00, dst.

```
## Soal 5
#### SCRIPT
```
awk ‘BEGIN{IGNORECASE=1} /cron/ && !/sudo/ && NF < 13’ /var/log/syslog >> /home/rye/sisop/modul1/syslogsoal5.log 
```
* Menyeleksi dari folder /var/log/syslog yang mengandung kata “cron” atau “CRON”, dan tidak mengandung kata “sudo”.
* Dari hasil seleksi tersebut, diprint 12 kolom pertama.
* Kemudian hasil tersebut diappend dalam file syslogsoal5.log dalam folder /home/rye/sisop/modul1/.

#### CRONTAB
* Gunakan perintah ``` crontab -e ``` pada terminal lalu tambahkan konfigurasi :
```
2-30/6 * * * * /bin/bash /home/rye/sisop/soal5.sh
```
* At every 6th minute from 2 through 30.
* Berikut hasil setelah script dijalankan :
<img src="https://github.com/ihdiannaja/SoalShift_modul1_F02/blob/master/Screenshot%20from%202019-03-02%2017-36-03.png" width="600">
