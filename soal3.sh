#!/bin/bash
i=1
j=1
ord=1
password=string
value=string
while [ $i -ne 0 ]
do
        if [[ -f /home/rye/sisop/nomor3/password$ord.txt ]] 
        then
                ord=$(($ord + 1))
        else
                while [ $j -ne 0 ]
                do
                        password="$(dd if=/dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)"
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

