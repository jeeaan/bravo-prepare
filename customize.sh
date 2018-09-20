#!/bin/bash

USUARIO_BRAVO="bravous"

gsettings set org.gnome.desktop.lockdown disable-lock-screen true

# Configuracoes do teclado virtual
gsettings set org.onboard.icon-palette in-use true
gsettings set org.onboard.window docking-enabled false
gsettings set org.onboard.auto-show enabled true

# Autostart do teclado virtual
mkdir -p ~/.config/autostart/
cp dependencies/autostart/onboard.desktop ~/.config/autostart/.
# Remocao de menu 'iniciar'
cp dependencies/autostart/remove-panel.desktop ~/.config/autostart/.

# Ativa o gnome acessibility
gsettings set org.gnome.desktop.interface toolkit-accessibility true

# Autologin
isInFile=$(cat /usr/share/lightdm/lightdm.conf.d/50-greeter-wrapper.conf | grep -c "autologin-user=$USUARIO_BRAVO")
if [ $isInFile -eq 0 ]; then
   echo "autologin-user=$USUARIO_BRAVO" >> /usr/share/lightdm/lightdm.conf.d/50-greeter-wrapper.conf
fi

# Imagem do wallpaper
cp dependencies/images/guarani-wallpaper.jpg /usr/share/wallpapers/.

# Configuracoes do xfce
cp dependencies/xfce-files/xfce4-desktop.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/.
cp dependencies/xfce-files/xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/.
cp dependencies/xfce-files/xfce4-power-manager.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/.
cp dependencies/xfce-files/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/.