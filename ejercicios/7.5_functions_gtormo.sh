#!/bin/bash
LOG="/home/$USER/minishell.log"

function createDirectory() {
    echo "Insert path and directoy's name:"
    read -e pathDirectory # -e: To autocomplete route with TAB

    if [ -a $pathDirectory ]
      then
        echo "[!] $pathDirectory had already created [!]"
    else
        if mkdir $pathDirectory 2>/dev/null
          then
            echo "$(date)--->$pathDirectory created." >> $LOG
        else
            echo "$(date)--->ERROR creating $pathDirectory" >> $LOG
        fi
    fi
}

function createFile() {
    echo "Insert path and file's name:"
    read -e pathFile # -e: To autocomplete route with TAB

    if [ -a $pathFile ]
      then
        echo "[!] $pathFile had already created [!]"
    else
        if touch $pathFile 2>/dev/null
          then
            echo "$(date)--->$pathFile created." >> $LOG
        else
            echo "$(date)--->ERROR creating $pathFile" >> $LOG
        fi
    fi
}

function listDirectory() {
    echo "Insert path and directoy's name:"
    read -e pathDirectory # -e: To autocomplete route with TAB

    if [ -a $pathDirectory ]
      then
        ls -l $pathDirectory
    else
      echo "$(date)--->ERROR, not found directoy: $pathDirectory" >> $LOG
    fi
}
