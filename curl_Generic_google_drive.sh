#!/bin/bash
# thanks to Brett McLain
# http://blog.mclain.ca/download-large-files-from-google-drive-via-curl/

filename="Nethserver-7.5.1804-Devel-Generic-img.raw.xz"
file_id="1VKeU6Gjqn26Cir0jm7fuaYgsEG6UYQvt"

query=`curl -c ./cookie.txt -s -L "https://drive.google.com/uc?export=download&id=${file_id}" \
| perl -nE'say/uc-download-link.*? href="(.*?)\">/' \
| sed -e 's/amp;//g' | sed -n 2p`
url="https://drive.google.com$query"
curl -b ./cookie.txt -L -o ${filename} $url

rm -f cookie.txt