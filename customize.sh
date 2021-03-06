#!/bin/bash
USUARIO_BRAVO=$1
DESKTOP_PATH=$2
WHERE_AM_I=$3
ONBOARD_KEY_DEF_FILE="/usr/share/onboard/layouts/key_defs.xml"

# Desabilita o travamento da tela
su $USUARIO_BRAVO -c "gsettings set org.gnome.desktop.lockdown disable-lock-screen true"

# Ativa o gnome acessibility
su $USUARIO_BRAVO -c "gsettings set org.gnome.desktop.interface toolkit-accessibility true"

# Configuracoes do teclado virtual
su $USUARIO_BRAVO -c "gsettings set org.onboard.icon-palette in-use true" # Icone flutuante do teclado
su $USUARIO_BRAVO -c "gsettings set org.onboard.window docking-enabled false" 
su $USUARIO_BRAVO -c "gsettings set org.onboard.auto-show enabled true"
cp "$WHERE_AM_I"/conf/key_defs.xml $ONBOARD_KEY_DEF_FILE # Retira teclas de quit e settings

# Autostart do teclado virtual
mkdir -p /home/"$USUARIO_BRAVO"/.config/autostart/
cp "$WHERE_AM_I"/autostart/onboard.desktop /home/"$USUARIO_BRAVO"/.config/autostart/.
# Remocao do menu iniciar
cp "$WHERE_AM_I"/autostart/remove-panel.desktop /home/"$USUARIO_BRAVO"/.config/autostart/.

# Autologin
isInFile=$(cat /usr/share/lightdm/lightdm.conf.d/50-greeter-wrapper.conf | grep -c "autologin-user=$USUARIO_BRAVO")
if [ $isInFile -eq 0 ]; then
   echo "autologin-user=$USUARIO_BRAVO" >> /usr/share/lightdm/lightdm.conf.d/50-greeter-wrapper.conf
fi

# Imagem do wallpaper
cp "$WHERE_AM_I"/images/guarani-wallpaper.jpg /usr/share/wallpapers/.

# Configuracoes do xfce
cp "$WHERE_AM_I"/xfce-files/xfce4-desktop.xml /home/"$USUARIO_BRAVO"/.config/xfce4/xfconf/xfce-perchannel-xml/.
cp "$WHERE_AM_I"/xfce-files/xfce4-panel.xml /home/"$USUARIO_BRAVO"/.config/xfce4/xfconf/xfce-perchannel-xml/.
cp "$WHERE_AM_I"/xfce-files/xfce4-power-manager.xml /home/"$USUARIO_BRAVO"/.config/xfce4/xfconf/xfce-perchannel-xml/.
cp "$WHERE_AM_I"/xfce-files/xfce4-keyboard-shortcuts.xml /home/"$USUARIO_BRAVO"/.config/xfce4/xfconf/xfce-perchannel-xml/.