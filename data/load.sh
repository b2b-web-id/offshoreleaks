#!/bin/bash
mysql -u root -p -e 'CREATE DATABASE IF NOT EXISTS offshoreleaks' -vvv
for i in *.sql.xz
do
 xzcat $i | mysql -u root -p offshoreleaks -vvv
done
