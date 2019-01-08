#!/bin/bash
echo ">>>Create data files.. $1 ... $2  folder"
#read first last
for k in $(seq $1 $2)
do
    echo ">>>Begining create /root/data/site-${k}"
    mkdir -p /root/data/site-${k}
    echo ">>>Copy mysql data /root/data/default/ to /root/data/site-${k}"
    cp -r /root/dep/20190101/data-default/* /root/data/site-${k}/
done
#tree /root/data/
