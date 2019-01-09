#!/bin/bash
#$1:Start number,$2:End number
#$3:Web site parent directory,last don't /   -- /var/www/html
#$4: Data file directory.last don't / --/var/lib/mysql
echo ">>>Createing site,$1 .... $2 sites"
#create web site
for k in $(seq $1 $2)
  do
    echo ">>> mkdir $3/site_${k}"
    mkdir -p $3/site_${k}
    echo "Copy site page to $3/site_${k}"
    cp -r source/litecart/* $3/site_${k}/
    echo "Replace config_${k}.inc.php in and replace $3/site_${k}/public_html/includes/config.inc.php "
    cp configs/config_${k}.inc.php $3/site_${k}/public_html/includes/config.inc.php
	echo "copy admin.htaccess to ${3}/site_${k} "
	cp htaccess/admin/site_${k}.htaccess  $3/site_${k}/public_html/admin/.htaccess
	echo "copy client.htaccess to ${3}/site_${k} "
	cp htaccess/client/site_${k}.htaccess $3/site_${k}/public_html/.htaccess
  done
  echo ">>>Create site complete!"
  echo ">>>Copy site database data in $4"
  #copy site db in mysql
  for k in $(seq $1 $2)
  do
    echo ">>> mkdir $4/site_${k}"
    mkdir -p $4/site_${k}
    echo "Copy site data to site_${k}"
    cp -r data-default/litecart/* $4/site_${k}/ 
 done
echo ">>>Change database privilege cd $4 chown -R mysql site_*  chgrp -R mysql site_* chmod -R 760 site_*"
chown -R mysql $4/site_*
chgrp -R mysql $4/site_*
echo ">>> reload database and flush-tables"
mysqladmin -uroot -pLitecart@2018 reload
mysqladmin -uroot -pLitecart@2018 flush-tables
