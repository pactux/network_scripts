#!/bin/bash

# By pactux
# You're free for to use and modify it!

usuario=$1

# check if the user is logged
who | grep -wi $usuario &> /dev/null

if [ $? -eq 0 ];then
	printf "\nO usuario \"%s\" está logado.\n\n" $usuario
else
	printf "\nO usuario \"%s\" não está logado atualmente.\n\n" $usuario
fi

exit 0;
