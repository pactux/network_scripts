#!/bin/bash

# By pactux
# You're free for to use and modify it!

# verifica se o usuário é ROOT
if [ $EUID -ne 0 ]; then
	printf "\nAcesso negado! Faça login como usuario \"root\" ou utilize \"sudo\".\n\n"
	exit 1;
fi

### funções para gerenciamento dos usuários ###

function adiciona
{
	local nome_user=$1

	adduser $nome_user
	
	if [ $? -eq 0 ];then
		return 0
	else
		return 1
	fi
}

function remove
{
	local nome_user=$1
	
	read -p "Deseja remover todos os arquivos do usuario selecionado? [s/n]: " opcao

	if [ $opcao = "s" ];then
		userdel -r $nome_user

		if [ $? -eq 0 ];then
			return 0
		else
			return 1
		fi
	elif [ $opcao = "n" ];then
		userdel $nome_user

		if [ $? -eq 0 ];then
			printf "O usuario foi removido mas os arquivos foram mantidos.\n\n"
			return 0
		else
			printf "Erro ao tentar remover o usuario...\n\n"
			return 1
		fi
	else
		printf "Opcao invalida...\n"
	fi
}

function define_senha
{
	local nome_user=$1

	passwd $nome_user

	if [ $? -eq 0 ];then
		return 0
	else
		return 1
	fi
}

function ajuda
{
	printf "\n\n*** Ajuda ***\n\n"
	printf "Possiveis erros retornados (variavel de retorno):\n\n"
	printf "1 - Erro de autenticacao do comando:\nPara usar o comando \"usuario_add.sh\", é necessario estar logado como ROOT\n\n"
}

### fim das funções ###

printf "\nGerenciador de usuarios:\n\n"

# cria menu de opções
PS3="Digite uma opção: "
menu=("Adicionar" "Remover" "Configurar senha" "Ajuda" "Finalizar")
sair="${#menu[@]}"

# inicia menu
select opcao in "${menu[@]}";do
	case $REPLY in
		1)
			read -p "Digite o nome do usuario: " usuario
			adiciona $usuario

			if [ $? -eq 0 ];then
				printf "O usuario \"%s\" foi criado com sucesso!\n\n" $usuario
				read -p "Deseja configurar uma senha para este usuario? [s/n]: " op_senha

				if [ $op_senha = "s" ];then
					define_senha $usuario

					if [ $? -eq 0 ];then
						printf "\nSenha configurada para o usuario \"%s\".\n\n" $usuario
					else
						echo -e "Erro ao configurar senha.\n"
					fi
				else
					printf "Senha não definida.\n"
					break
				fi
			else
				printf "O usuario \"%s\" nao foi criado...\n\n" $usuario
			fi
			;;
		2)
			read -p "Digite o usuario a ser removido: " usuario
			remove $usuario

			if [ $? -eq 0 ];then
				printf "O usuario \"%s\" foi removido com sucesso!\n\n" $usuario
			else
				printf "Erro ao remover o usuario \"%s\"...\n\n" $usuario
			fi
			;;

		3)
			read -p "Digite o nome do usuario: " usuario

			define_senha $usuario

			if [ $? -eq 0 ];then
				printf "\nSenha configurada para o usuario \"%s\".\n\n" $usuario
			else
				echo -e "Erro ao configurar senha.\n"
			fi
			;;

		4)
			ajuda
			;;

		$sair)
			echo -e "\nSoftware finalizado.\n"
			break
			;;

		*)
			echo -e "\nOpção iva]álida.\n"
			;;
	esac
done

exit 0
