# shell_script
Algoritmos para gerenciamneto de usuários em ambiente servidor (GNU/Linux).

<b>Texto para referência:</b>
http://manjaro-linux.com.br/forum/programacao/gerenciamento-de-usuarios-e-mais-algumas-coisas-t3649.html

<h2>Tutorial</h2>

- Permissão de execução para todos os arquivos

$ chmod +x usuario_*

<h4>usuario_logado.sh</h4>
Verifica se o usuário informado está logado no sistema operacional.

- Uso

$ ./usuario_logado.sh usuario

<h4>usuario_existe.sh</h4>
Verifica se o usuário informado existe no sistema operacional.

- Uso

$ ./usuario_existe.sh usuario

<h4>usuario_info.sh</h4>
Verifica se o usuário escolhido está logado e exibe informações básicas do mesmo caso esteja.

- Uso

$ ./usuario_info.sh

Ao aparecer o menu de usuários, escolher o número correspondente para saber se o usuário está logado e obter informações.

<h4>usuario_add.sh</h4>
Gerenciamento básico dos usuários do sistema operacional (adiciona, remove e define senha).

- Uso

\# ./usuario_add.sh

É necessário possuir privilégios <b>ROOT</b> para executa-lo

<h2>Mais</h2>

Para tornar os <b>scripts</b> "comandos do sistema", mova-os para o diretório /usr/bin/

$ mv -v usuario_* /usr/bin/
