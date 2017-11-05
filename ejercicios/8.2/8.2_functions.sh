#!/bin/bash

LOG="/home/$USER/8.2-log.log"

function createDB() {
    if mysql $first_connect < sql/db.sql 2>/dev/null
      then
        echo "$(date)---> Sucsseful connection to MYSQL DB." >> $LOG
    else
        echo "$(date)---> ERROR connecting to MYSQL DB" >> $LOG
    fi
}

function changePassword() {
    if passwd $user
      then
        echo "$user's password have been changed"
    else
        echo "[!] ERROR changing $user's password [!]"
    fi
}

function listHome() {
  ls -l $(cat /etc/passwd | grep -w "$user" | cut -d ":" -f 6)
}

function pathHomeUser() {
  cat /etc/passwd | grep -w "$user" | cut -d ":" -f 6
}

function shellUser() {
  cat /etc/passwd | grep -w "$user" | cut -d ":" -f 7
}

function groupsUser() {
  cat /etc/group | grep -w "$user" | cut -d ":" -f 1
}

function fullNameAndLogin() {
  cat /etc/passwd | grep -w "$user" | cut -d ":" -f 1 #login
  cat /etc/passwd | grep -w "$user" | cut -d ":" -f 5 #full name
}

function injectToDB() {
  pathHome=$(cat /etc/passwd | grep -w "$user" | cut -d ":" -f 6)
  shell=$(cat /etc/passwd | grep -w "$user" | cut -d ":" -f 7)
  fullName=$(cat /etc/passwd | grep -w "$user" | cut -d ":" -f 5)

  if mysql $connect "INSERT INTO $sql_database.user(username, pathHome, shell, fullName)
      VALUES('$user', '$pathHome', '$shell', '$fullName')" 2>/dev/null
    then
      echo "$(date)--->Succesful INSERT INTO in $sql_database." >> $LOG
  else
      echo "$(date)--->ERROR inserting in $sql_database." >> $LOG
  fi
}
