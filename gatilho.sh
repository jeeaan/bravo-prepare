#!/bin/bash

USUARIO_BRAVO="bravous"

# DESKTOP_PATH hardcoded pq mesmo usando o xdg-user-dir o espaco da 'Area de Trabalho' tava quebrando
#DESKTOP_PATH=$(xdg-user-dir DESKTOP)
DESKTOP_PATH="/home/bravous/Desktop"
ln -s /home/bravous/Área\ de\ Trabalho/ /home/bravous/Desktop

MAIS="$DESKTOP_PATH/brilho_mais.desktop"
MENOS="$DESKTOP_PATH/brilho_menos.desktop"
TECLADO="$DESKTOP_PATH/teclado.desktop"

if [ -f "$MAIS" ] && [ -f "$MENOS" ]  && [ -f "$TECLADO" ]
then
	# Assumindo que o sistema esta ok!
	exit 0
else
	# Esta faltando algum icone e vou 'reconfigurar' o sistema
	/opt/bravo-prepare/customize.sh $USUARIO_BRAVO $DESKTOP_PATH
	/opt/bravo-prepare/atalhos.sh $USUARIO_BRAVO $DESKTOP_PATH
	exit 1
fi