#!/bin/bash

sudo yum -y install postgresql-server postgresql-contrib
sudo postgresql-setup initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo -u postgres createuser druid;
sudo -u postgres psql -c "create database druid;"
sudo -u postgres psql -c "alter user druid with encrypted password 'admin'";
sudo -u postgres psql -c "grant all privileges on database druid to druid";
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /var/lib/pgsql/data/postgresql.conf
echo 'hostnossl    all          all            0.0.0.0/0  trust' | sudo tee -a /var/lib/pgsql/data/pg_hba.conf
sudo systemctl restart postgresql