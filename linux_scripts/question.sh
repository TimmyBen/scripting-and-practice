#! /bin/bash 
file="$1"
arr_csv=() 
while IFS= read -r line 
do
    arr_csv+=("$line")
done < <(cut -d "," -f3 "$file" | tail -n +2)

for record in "${arr_csv[@]}"; do useradd "$record" ; done

for record in "${arr_csv[@]}"; do id "$record" ; done
sudo addgroup Engineering




sudo usermod --append -G Engineering "${arr_csv[@]}"