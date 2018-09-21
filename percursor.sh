#!/bin/bash
FIRST_BOOT="/opt/.firstboot"
SECOND_BOOT="/opt/.secondboot"
USUARIO_BRAVO="bravous"
WHERE_AM_I="/opt/bravo-prepare"
DESKTOP_PATH="$(runuser -u $USUARIO_BRAVO xdg-user-dir DESKTOP)"
MAIS="$DESKTOP_PATH/brilho_mais.desktop"
MENOS="$DESKTOP_PATH/brilho_menos.desktop"
TECLADO="$DESKTOP_PATH/teclado.desktop"

function lightdm_is_running {
	STATUS=$(systemctl status lightdm | grep "running")
	if [ -z "$STATUS" ] && [ ! -f "SECOND_BOOT" ]
	then
		# Flag para rebootar o sistema APENAS na primeira execucao depois da instalacao
		touch $SECOND_BOOT
		reboot
	else
		false;
	fi
	return $?;
}

if [ ! -f "$FIRST_BOOT" ]
then
	# Flag para conseguir dar boot e instalar o sistema
	touch $FIRST_BOOT
	exit 0
fi

if [ -f "$MAIS" ] && [ -f "$MENOS" ]  && [ -f "$TECLADO" ]
then
	# Assumindo que o sistema esta ok, o script morre aqui toda vez que o sistema inicia
	exit 0
else
	# Primeira execucao ou esta faltando algum icone e vou '(re)configurar' o sistema
	"$WHERE_AM_I"/customize.sh $USUARIO_BRAVO "$DESKTOP_PATH" $WHERE_AM_I
	"$WHERE_AM_I"/atalhos.sh $USUARIO_BRAVO "$DESKTOP_PATH" $WHERE_AM_I
	while lightdm_is_running ; do true; done
fi