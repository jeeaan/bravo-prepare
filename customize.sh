#!/bin/bash
USUARIO_BRAVO=$1
DESKTOP_PATH=$2

# Desabilita o travamento da tela
gsettings set org.gnome.desktop.lockdown disable-lock-screen true

# Configuracoes do teclado virtual
gsettings set org.onboard.icon-palette in-use true
gsettings set org.onboard.window docking-enabled false
gsettings set org.onboard.auto-show enabled true

# Autostart do teclado virtual
mkdir -p /home/"$USUARIO_BRAVO"/.config/autostart/
cp autostart/onboard.desktop /home/"$USUARIO_BRAVO"/.config/autostart/.
# Remocao de menu 'iniciar'
cp autostart/remove-panel.desktop /home/"$USUARIO_BRAVO"/.config/autostart/.

# Ativa o gnome acessibility
gsettings set org.gnome.desktop.interface toolkit-accessibility true

# Autologin
isInFile=$(cat /usr/share/lightdm/lightdm.conf.d/50-greeter-wrapper.conf | grep -c "autologin-user=$USUARIO_BRAVO")
if [ $isInFile -eq 0 ]; then
   echo "autologin-user=$USUARIO_BRAVO" >> /usr/share/lightdm/lightdm.conf.d/50-greeter-wrapper.conf
fi

# Imagem do wallpaper
cp images/guarani-wallpaper.jpg /usr/share/wallpapers/.

# Configuracoes do xfce
cp xfce-files/xfce4-desktop.xml /home/"$USUARIO_BRAVO"/.config/xfce4/xfconf/xfce-perchannel-xml/.
cp xfce-files/xfce4-panel.xml /home/"$USUARIO_BRAVO"/.config/xfce4/xfconf/xfce-perchannel-xml/.
cp xfce-files/xfce4-power-manager.xml /home/"$USUARIO_BRAVO"/.config/xfce4/xfconf/xfce-perchannel-xml/.
cp xfce-files/xfce4-keyboard-shortcuts.xml /home/"$USUARIO_BRAVO"/.config/xfce4/xfconf/xfce-perchannel-xml/.