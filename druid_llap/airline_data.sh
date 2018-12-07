#!/bin/bash

sudo yum -y install parallel

echo "get get-airline-data.sh from aws"
sudo su - hive -c "wget https://s3-us-west-2.amazonaws.com/sunileman1/scripts/get-airline-data.sh -P /home/hive/"

echo "chmod to 777"
sudo su - hive -c "chmod 777 /home/hive/get-airline-data.sh"

echo "run get-airline-data.sh"
#sudo su - hive -c "nohup /home/hive/get-airline-data.sh > /dev/null 2>&1 &"
sudo su - hive -c "nohup /home/hive/get-airline-data.sh > nohup2.out 2>&1&"

echo "exit script"
exit 0