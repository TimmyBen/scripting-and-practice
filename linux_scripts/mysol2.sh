#! /usr/bin/bash
# Save the original IFS
oIFS=$IFS
IFS=","
while read firstname lastname username
do
    echo "$firstname $lastname $username"
done < ./sample.csv