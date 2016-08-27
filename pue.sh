#!/bin/bash

# pue - Pactux User Exists? - By pactux
# Licence: GPLv3+ <http://gnu.org/licenses/gpl.html>
# You're free to use and modify it

grep -wi $1 /etc/passwd &> /dev/null

if [ $? -eq 0 ];then
	printf "\nO usuario '%s' existe no sistema\n\n" $1
else
	printf "\nO usuario '%s' nao existe\n\n" $1
fi

exit 0