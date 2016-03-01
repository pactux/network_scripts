#!/bin/bash

# By pactux
# You're free for to use and modify it!

usuario=$1

# find user in the system
grep -wi $usuario /etc/passwd &> /dev/null

# check if the user exist
if [ $? -eq 0 ];then
	printf "\nO usuario \"%s\" existe no sistema.\n\n" $usuario
else
	printf "\nO usuario \"%s\" não existe!\n\n" $usuario
fi

exit 0
