#!/bin/bash

USUARIO_BRAVO="bravous"

# Controlador do brilho da tela
cp scripts/brilho.py /opt/.

# Atalhos da area de trabalho
DESKTOP_PATH=$(xdg-user-dir DESKTOP)
cp dependencies/atalhos/brilho_mais.desktop "$DESKTOP_PATH"/.
cp dependencies/atalhos/brilho_menos.desktop "$DESKTOP_PATH"/.
cp dependencies/atalhos/teclado.desktop "$DESKTOP_PATH"/.
cp dependencies/atalhos/network.desktop "$DESKTOP_PATH"/.
cp dependencies/atalhos/instalador-gcb.desktop /usr/share/applications/.

# Figura dos atalhos
cp dependencies/images/tank.png /usr/share/icons/.
cp dependencies/images/brilho_menos.png /usr/share/icons/.
cp dependencies/images/brilho_mais.png /usr/share/icons/.
cp dependencies/images/wifi.png /usr/share/icons/.

# Define que arquivo .bin abre com o java -jar
isInFile=$(cat /usr/share/applications/defaults.list | grep -c "application/octet-stream=instalador-gcb.desktop")
if [ $isInFile -eq 0 ]; then
   echo "application/octet-stream=instalador-gcb.desktop" >> /usr/share/applications/defaults.list
fi
chmod +x /usr/share/applications/instalador-gcb.desktop

# Trava a posicao dos atalhos na area de trabalho
tee ~/.config/xfce4/desktop/icons.screen0-784x584.rc <<EOF
[xfdesktop-version-4.10.3+-rcfile_format]
4.10.3+=true

[$DESKTOP_PATH/network.desktop]
row=3
col=4

[$DESKTOP_PATH/brilho_menos.desktop]
row=3
col=0

[$DESKTOP_PATH/teclado.desktop]
row=3
col=5

[$DESKTOP_PATH/bravo.desktop]
row=0
col=0

[$DESKTOP_PATH/brilho_mais.desktop]
row=3
col=1
EOF
chattr +i ~/.config/xfce4/desktop/icons*

# Da permissao de execucao para os atalhos
chown $USUARIO_BRAVO:$USUARIO_BRAVO "$DESKTOP_PATH"/*
chmod +x "$DESKTOP_PATH"/*