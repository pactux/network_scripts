#!/bin/bash

# puseradd - Pactux User Add - By pactux
# Licence: GPLv3+ <http://gnu.org/licenses/gpl.html>
# You're free to use and modify it

if [[ $EUID -ne 0 ]]; then
	printf "\nPermissao negada. Utilize sudo\n\n"
	exit 1
fi

function p_add {
	useradd -mg $2 $1

	if [[ $? -eq 6 ]] || [[ $? -eq 9 ]]; then
		echo "Impossivel criar usuario. Verifique o usuario e grupo fornecido"
		return 1
	fi
}

function p_rm {
	read -p "Deletar diretorio do usuario? [s/n]: " sn

	if [[ $sn = "s" ]]; then
		userdel -r $1
	else
		userdel $1
	fi
}

function p_ans {
	if [[ $1 -eq 0 ]]; then
		echo "Acao executada com sucesso"
	else
		echo "Erro ao executar acao"
	fi
}

trap "printf '\n\nUtilize a opcao Sair do menu\n'" SIGINT SIGTERM

PS3="Selecione uma opcao: "
menu=("Adicionar usuario" "Remover usuario" "Alterar senha" "Criar grupo" "Remover grupo" "Sair")
sair="${#menu[@]}"

printf "\n*** puseradd - Menu ***\n\n"

select opcao in "${menu[@]}"; do
	case $REPLY in
		1)
			read -p "Nome do usuario: " add_usuario && read -p "grupo: " grupo
			p_add $add_usuario $grupo
			p_ans $?;;

		2)
			read -p "Nome do usuario: " rm_usuario
			p_rm $rm_usuario
			p_ans $?;;

		3)
			read -p "Nome do usuario: " pass_usuario
			passwd $pass_usuario;;

		4)
			read -p "ID do grupo: " id_grupo && read -p "Nome do grupo: " grupo
			groupadd -g $id_grupo $grupo
			p_ans $?;;

		5)
			read -p "Nome do grupo: " rm_grupo
			groupdel $rm_grupo
			p_ans $?;;

		$sair)
			exit 0;;

		*)
			printf "\nOpcao invalida\n\n";;
	esac
done