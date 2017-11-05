#!/bin/bash

sql_host="127.0.0.1"
sql_user="root"
sql_password="1234"
sql_database="linux_users"

connect="-h $sql_host -u $sql_user -p$sql_password --execute" #--disable-column-names: To hide column name
first_connect="-h $sql_host -u $sql_user -p$sql_password"
