#!/bin/bash

USUARIO_BRAVO="bravous"
WHERE_AM_I="/opt/bravo-prepare"

# DESKTOP_PATH hardcoded pq mesmo usando o xdg-user-dir o espaco da 'Area de Trabalho' tava quebrando
DESKTOP_PATH="$(runuser -u $USUARIO_BRAVO xdg-user-dir DESKTOP)"

MAIS="$DESKTOP_PATH/brilho_mais.desktop"
MENOS="$DESKTOP_PATH/brilho_menos.desktop"
TECLADO="$DESKTOP_PATH/teclado.desktop"

if [ -f "$MAIS" ] && [ -f "$MENOS" ]  && [ -f "$TECLADO" ]
then
	# Assumindo que o sistema esta ok!
	exit 0
else
	# Esta faltando algum icone e vou 'reconfigurar' o sistema
	"$WHERE_AM_I"/customize.sh $USUARIO_BRAVO "$DESKTOP_PATH" $WHERE_AM_I
	"$WHERE_AM_I"/atalhos.sh $USUARIO_BRAVO "$DESKTOP_PATH" $WHERE_AM_I
	xfdesktop --reload
	exit 1
fi