#!/bin/bash

# By pactux
# You're free for to use and modify it!

usuario=$1

# pesquisa pelo usuario no sistema
grep -wi $usuario /etc/passwd &> /dev/null

# verifica se o usuario indicado existe
if [ $? -eq 0 ];then
	printf "\nO usuario \"%s\" existe no sistema.\n\n" $usuario
else
	printf "\nO usuario \"%s\" não existe!\n\n" $usuario
fi

exit 0
