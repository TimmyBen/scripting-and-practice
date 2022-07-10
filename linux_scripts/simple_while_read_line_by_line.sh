while read message
do
    echo $message
    sleep 1
    date
done < /etc/fstab

  
