#!/bin/bash

# By pactux
# You're free for to use and modify it!

# select the /etc/passwd archive and define PS3 variable
PS3="Selecione uma opcao: "
arquivo=$(cat /etc/passwd | cut -d : -f 1)

# create a "/etc/passwd" menu
select usuario in $arquivo "sair";do

	if [ $usuario != "sair" ];then

		w | grep -wi $usuario &> /dev/null

		# check if the user is logged
		if [ $? -gt 0 ];then

			printf "\nO usuario \"%s\" não está logado atualmente.\n\n" $usuario

		else

			# select user name, UID and user shell
			nome=$(grep -wi $usuario /etc/passwd | cut -d : -f 1)
			uid=$(grep -wi $usuario /etc/passwd | cut -d : -f 3)
			shell=$(grep -wi $usuario /etc/passwd | cut -d : -f 7)

			printf "\nO usuario \"%s\" está logado:\n\n" $usuario
			printf "Nome: %s\n" $nome
			printf "UID: %s\n" $uid
			printf "Shell: %s\n\n" $shell

		fi

	else

		echo -e "\nSoftware encerrado\n"
		exit 0

	fi

done

exit 0
