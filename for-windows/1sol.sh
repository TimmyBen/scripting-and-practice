#! /usr/bin/bash
# Save the original IFS
echo -e '\n' >> sample.csv
oIFS=$IFS
IFS=","
while read firstname lastname username 
do
    sudo useradd $firstname
    if [[ ! $(cat /etc/group | grep engineering) ]];
    then
        sudo groupadd engineering
    sudo usermod -d "/home/$firstusername" -aG engineering 
    userpasswd=$RANDOM
    echo -e "$userpasswd\n$userpasswd" | sudo passwd $firstname
    echo "$firstname's password: $userpasswd" >> passwd.txt 
done < ./sample.csv