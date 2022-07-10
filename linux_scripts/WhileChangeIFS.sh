#!/bin/bash
# Save the original IFS
oIFS=$IFS
IFS=":"
# /etc/passwd is delimited by colons only.
while read login pass uid gid name home shell
do
    # Ignore those with /bin/false, or home directories in /var
    if [ "$shell" != "/bin/false" ] && [ ! -z "${home%\/var\/*}" ]; then
        echo "User $login ($name) lives in $home and uses `basename $shell`"
    fi
done < /etc/passwd