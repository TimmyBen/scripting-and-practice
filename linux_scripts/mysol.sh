#!/bin/bash 
oIFS=$IFS
IFS="
"
engineers=( `cat sample.csv` ) 
for engineer in "${engineers[@]}" 
do
    echo Engineer: $engineer 
done
# always restore IFS or insanity will follow... 
IFS=$oIFS