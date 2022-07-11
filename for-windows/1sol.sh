#! /usr/bin/bash
# Save the original IFS
echo -e '\n' >> sample.csv
oIFS=$IFS
IFS=","
while read firstname lastname username 
do
    if [[ $firstname = *"First"* ]] ||  [[ $lastname = *"Last"* ]] ||  [[ $username = *"Username"* ]] 
    then
        echo "Skipping this"
        sleep 1
        echo
    elif [[ ! $(cat /etc/passwd | grep "$username") ]]
    then
        echo "Skipping again"
    else 
        sudo useradd "$username"
        fi
        if [[ ! $(cat /etc/group | grep engineering) ]];
        then
            sudo groupadd engineering
            sudo usermod -d "/home/$username" -aG engineering $username
            userpasswd=$RANDOM
            echo -e "$userpasswd\n$userpasswd" | sudo passwd $username
            echo "$username's password: $userpasswd" >> passwd.txt 
        fi
    fi
    # echo "The First Name is: $firstname, Last name is: $lastname and Username is: $username"
    # sleep 1
    # date
    # if [[ -z "$firstname" ||  -z "$lasttname" ||  -z "$username" ]]
    # then 
    #     exit 0
    # fi
done < ./sample.csv