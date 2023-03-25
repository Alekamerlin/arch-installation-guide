#!/bin/bash

# desktop
gsettings set org.gnome.desktop.input-sources per-window true
# gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us')]"
gsettings set org.gnome.desktop.interface clock-show-weekday true
# gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 11'
gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
gsettings set org.gnome.desktop.interface font-hinting 'full'
# gsettings set org.gnome.desktop.interface font-name 'Cantarell 11'
gsettings set org.gnome.desktop.interface font-rgba-order 'rgba'
# gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro 10'
gsettings set org.gnome.desktop.interface show-battery-percentage true
# gsettings set org.gnome.desktop.peripherals.mouse speed '-0.25431034482758619'
gsettings set org.gnome.desktop.sound event-sounds true
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.preferences button-layout ':'
gsettings set org.gnome.desktop.wm.preferences num-workspaces 2

# eog
gsettings set org.gnome.eog.fullscreen loop false
gsettings set org.gnome.eog.fullscreen upscale false
gsettings set org.gnome.eog.ui sidebar false
gsettings set org.gnome.eog.view extrapolate false
gsettings set org.gnome.eog.view use-background-color false

