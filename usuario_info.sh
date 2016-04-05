#!/bin/bash

# By pactux
# You're free for to use and modify it!

# define a variável de interação
# e seleciona todos usuários do sistema
PS3="Selecione uma opcao: "
arquivo=$(cat /etc/passwd | cut -d : -f 1)

# cria um menu com os usuários selecionados
select usuario in $arquivo "sair";do
	if [ $usuario != "sair" ];then
		who | grep -wi $usuario &> /dev/null

		# checa se o usuário está logado 
		if [ $? -gt 0 ];then
			printf "\nO usuario \"%s\" não está logado atualmente.\n\n" $usuario
		else
			# seleciona o nome, UID e shell do usuário
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
