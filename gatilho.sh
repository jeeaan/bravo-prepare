#!/bin/bash
PWD=$(pwd)
DESKTOP_PATH=$(xdg-user-dir DESKTOP)
MAIS="$DESKTOP_PATH/brilho_mais.desktop"
MENOS="$DESKTOP_PATH/brilho_menos.desktop"
TECLADO="$DESKTOP_PATH/teclado.desktop"

if [ -f "$MAIS" ] && [ -f "$MENOS" ]  && [ -f "$TECLADO" ]
then
	# Assumindo que o sistema esta ok!
	exit 0
else
	# Esta faltando algum icone e vou 'reconfigurar' o sistema
	echo $DESKTOP_PATH
	echo $PWD
	./customize.sh
	./atalhos.sh
	exit 1
fi