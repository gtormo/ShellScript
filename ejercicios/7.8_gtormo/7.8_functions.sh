#!/bin/bash

function hidePassword() {
  unset password
  prompt="Insert password:"

  while IFS= read -p "$prompt" -r -s -n 1 char
    do
      if [[ $char == $'\0' ]]
        then
          break
      fi
      prompt='*'
      password+="$char"
    done
}

function createUser() {
  echo "Insert name for the new user:"
  read username
  echo "Insert password:"
  read -s password

  if cat /etc/passwd | grep -w "$username" 1>/dev/null
    then
      echo "$username has already in use!"
  else
    #Cripting $password using perl:
    pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)

    if useradd -m -p $pass $username 2>/dev/null
      then
        echo "$username has been added to the system!"
    else
        echo "ERROR: You need to be admin!"
    fi
  fi
}

function removeUser() {
  echo "Insert username:"
  read username

  if cat /etc/passwd | grep -w "$username" 1>/dev/null
    then
      echo "Removing $username from the system..."
      sleep 1

      if userdel $username 1>/dev/null
        then
          echo "$username has been removed from the system!"
      else
          echo "ERROR: You need to be admin!"
      fi
  else
      echo "ERROR: $username has not been found in the system."
  fi
}

function changePassword() {
  echo "Insert username:"
  read username

  if cat /etc/passwd | grep -w "$username" 1>/dev/null
    then
      echo "Updating $username's password from the system..."
      sleep 1

      if passwd $username
        then
          echo "$username's password has been changed from the system!"
      else
          echo "ERROR: You need to be admin!"
      fi
  else
      echo "ERROR: $username has not been found in the system."
  fi
}

function changeShell() {
  shell=("sh" "zsh" "bash" "ksh")
  echo "Insert username"
  read username

  if cat /etc/passwd | grep -w "$username" 1>/dev/null
    then
      echo "Avaliable shells:
            $(chsh -l)"
      echo "Insert the path and name of shell(Example: /bin/bash)"
      read -e shell

      echo "Updating $username's shell from the system..."
      sleep 1

      if chsh -s $shell $username
        then
          echo "$username's shell has been changed from the system!"
      else
          echo "ERROR: You need to be admin! or invalid arguments"
      fi
  else
      echo "ERROR: $username has not been found in the system."
  fi
}

function listUsers() {
  echo "Listing all user's system..."
  sleep 1
  cut -d ":" -f 1 /etc/passwd
}

function listInfo() {
  echo "Insert username:"
  read username

  echo "Searching $username from the system..."
  sleep 1

  if cat /etc/passwd | grep -w "$username" 1>/dev/null
    then
      username=$(cat /etc/passwd | grep -w "$username" | cut -d ":" -f 1)
      passwordCrypt=$(cat /etc/passwd | grep -w "$username" | cut -d ":" -f 2)
      uid=$(cat /etc/passwd | grep -w "$username" | cut -d ":" -f 3)
      gid=$(cat /etc/passwd | grep -w "$username" | cut -d ":" -f 4)
      name=$(cat /etc/passwd | grep -w "$username" | cut -d ":" -f 5)
      home=$(cat /etc/passwd | grep -w "$username" | cut -d ":" -f 6)
      shell=$(cat /etc/passwd | grep -w "$username" | cut -d ":" -f 7)

      echo "
      Username: $username
      Password Crypt: $passwordCrypt
      UID: $uid
      GID: $gid
      Name: $name
      Home: $home
      Shell: $shell"
  else
      echo "ERROR: $username has not been found in the system."
  fi
}
