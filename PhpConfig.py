#!/usr/bin/python
# -*- coding: UTF-8 -*-
import sys;
import subprocess;
def builderConfig(dbServerIp="localhost",userName="litecart",
                  password="diev7Ugh3fushieV1che",startIndex=1,endIndex=1):
    source_data = None;
    new_data = None;
    try:
        # global source_data;

        for num in range(int(startIndex),int(endIndex) + 1):
            source_data = open("config.template.php", "r");
            dataBaseName = "site_" + str(num);
            print(dataBaseName);
            # global new_data;
            new_data = open("configs/config_" + str(num) + ".inc.php","w");
            # 替换${ip} ${user_name} ${password} ${db_name}
            for data in source_data.readlines():
                new_str = data.replace("${ip}",dbServerIp);
                new_str = new_str.replace("${user_name}",userName);
                new_str = new_str.replace("${password}", password);
                new_str = new_str.replace("${db_name}", dataBaseName);
                new_data.write(new_str);
            new_data.close();
    except Exception as error:
        print("traceback.print_exc():" + repr(error));

    source_data.close();
    print("new_data.close()");
    new_data.close();
    print("end...");

def main():
    dbServerIp = input("Please input database server ip address:");
    print("Database server ip:" + dbServerIp);
    userName = input("Please input database user name:");
    password = input("Please input database password:");
    #databasename = input("Please input database name:");
    starIndex = input("Please input start number:");
    endIndex = input("Please input end number:")
    builderConfig(dbServerIp,userName,password,starIndex,endIndex);

main();