## Descrição

Conjunto de scripts p/ transformação do Linux Mint Xfce 19.

### Pré-condição:
- Linux Mint 19 xfce customizado com chrome, jre, git, ssh-server e htop;
- Serviço *enabled* para iniciar os scripts (`/etc/systemd/system/gatilho.service`); e
- Repositório bravo-prepare (`/opt/bravo-prepare`).

### Ordem de execução:
- /etc/systemd/system/gatilho.service
	- percursor.sh
		- customize.sh
		- atalhos.sh

### O que cada um faz?
- `/etc/systemd/system/gatilho.service`
	- É um serviço, é executado TODA VEZ que a máquina inicia.
- `percursor.sh`
	- Verifica se é a primeira vez que o script está rodando (boot da iso), não faz nada. Vai esperar o sistema ser instalado;
	- Verifica se é a segunda vez que o script está rodando (o sistema acabou de reiniciar logo após o final da instalação). Vai rodar os scripts de customização;
	- Espera até que o lightdm inicie (modo gráfico), assim que ele iniciar REINICIA o sistema automaticamente pela última vez.
	- Todas as outras vezes em que o sistema iniciar, vai verificar se todos os ícones estão na área de trabalho, caso não estejam, roda os scripts de customização.

- `customize.sh`
	- Remove o travamento da tela;
	- Ativa o gnome acessibility (precisa p/ o teclado virtual);
	- Ativa e configura o teclado virtual;
	- Remove o menu iniciar;
	- Remove a tela de login; e
	- Configura atalhos do teclado, single click, wallpaper (xfce-files).

- `atalhos.sh`
	- Adiciona o script controlador de brilho;
	- Atalhos do desktop, copia atalhos, imagens e trava a posição de cada um;
	- Configura do .bin com o java -jar;