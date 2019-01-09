#!/bin/bash
#$1:Start number,
#$2:End number
#
echo ">>>insert data to  site,$1 .... $2 sites"
for k in $(seq $1 $2)
  do
     echo "insert data into site_${k}"
	 cd /root/dep
     mysql -uroot -pLitecart@2018 site_${k} < site_assgin.sql
   done
echo "success"