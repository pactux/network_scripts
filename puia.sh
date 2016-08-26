#!/bin/bash

# puia - Pactux User Is Active? - By pactux
# Licence: GPLv3+ <http://gnu.org/licenses/gpl.html>
# You're free to use and modify it

c=1
usuario=$(who | grep -wi $1)

if [[ $? -eq 0 ]]; then
	while [[ $c -le 4 ]]; do
		f=$(echo $usuario | cut -d " " -f $c)
		a+=($f) && c=$(expr $c \+ 1)
	done

	printf "\nO usuario '%s' esta logado na %s desde %s de %s\n\n" ${a[0]} ${a[1]} ${a[3]} ${a[2]}
else
	printf "\nO usuario '%s' nao esta logado atualmente\n\n" $1
fi

exit 0