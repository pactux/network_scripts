#!/bin/bash

# puinfo - Pactux User Info - By pactux
# Licence: GPLv3+ <http://gnu.org/licenses/gpl.html>
# You're free to use and modify it

trap sinais SIGINT SIGTERM

function sinais {
	printf "\n\nUtilize a opcao 'exit' do menu"
}

PS3="Selecione uma opcao: "
a=$(cat /etc/passwd | cut -d : -f 1)

select u in $a "exit"; do
	if [ $u = "exit" ]; then
		exit 0
	else
		un=$(grep -wi "^$u" /etc/passwd | cut -d : -f 1)
		uid=$(grep -wi "^$u" /etc/passwd | cut -d : -f 3)
		gid=$(grep -wi "^$u" /etc/passwd | cut -d : -f 4)
		drt=$(grep -wi "^$u" /etc/passwd | cut -d : -f 6)
		shell=$(grep -wi "^$u" /etc/passwd | cut -d : -f 7)

		printf "\nUser: %s\n" $un
		printf "UserID: %s\n" $uid
		printf "GroupID: %s\n" $gid
		printf "Directory: %s\n" $drt
		printf "Shell: %s\n\n" $shell
	fi
done