#!/bin/bash

unzip /home/rye/sisop/nature.zip -d /home/rye/sisop
mkdir /home/rye/sisop/nature_decrypted

i="1"

for photo in /home/rye/sisop/nature/*.jpg
do
base64 -d $photo | xxd -r > /home/rye/sisop/nature_decrypted/$i.jpg
i=$(($i + 1))
done
