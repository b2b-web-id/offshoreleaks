#!/bin/bash
mysql -u root -p -e 'CREATE DATABASE IF NOT EXISTS offshoreleaks' -vvv
for i in *.sql.xz
do
 xzcat $i | mysql -u root -p offshoreleaks -vvv
done

# Hilangkan komentar bila ingin menambahkan pengguna
#mysql -u root -e "CREATE USER offshoreleaks@localhost IDENTIFIED BY ''" -p
#mysql -u root -e "GRANT ALL PRIVILEGES ON offshoreleaks.* TO offshoreleaks@localhost" -p

