# network_scripts
Scripts para gerenciamneto de usuários em ambiente servidor (GNU/Linux).

<b>Texto para referência:</b>
http://manjaro-linux.com.br/forum/programacao/gerenciamento-de-usuarios-e-mais-algumas-coisas-t3649.html

<h2>Tutorial</h2>

- Permissão de execução para os scripts

$ chmod +x script.sh

<h4>puia.sh</h4>
Verifica se o usuário informado está logado no sistema operacional.

- Uso

$ ./puia.sh usuario

<h4>pue.sh</h4>
Verifica se o usuário informado existe no sistema operacional.

- Uso

$ ./pue.sh usuario

<h4>puinfo.sh</h4>
Lista todos usuários do sistema operacional e exibe informações básicas sobre eles.

- Uso

$ ./puinfo.sh

Ao aparecer o menu de usuários, escolher o número correspondente para obter informações.

<h4>puseradd.sh</h4>
Gerenciamento básico dos usuários do sistema operacional (adiciona, remove, define grupos e senhas).

- Uso

\# ./puseradd.sh

É necessário possuir privilégios <b>ROOT</b> para executa-lo.

<h2>Mais</h2>

Para tornar os <b>scripts</b> "comandos do sistema", mova-os para o diretório /usr/local/bin/

$ mv -v script.sh /usr/local/bin/
