#!/bin/bash

# control-center
if command -v gnome-control-center &> /dev/null; then
    gsettings set org.gnome.Settings window-state '(980, 940, false)'
fi

# desktop
gsettings set org.gnome.desktop.input-sources per-window true
# gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us')]"
gsettings set org.gnome.desktop.interface clock-show-weekday true
# gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 11'
gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
gsettings set org.gnome.desktop.interface font-hinting 'full'
# gsettings set org.gnome.desktop.interface font-name 'Cantarell 11'
gsettings set org.gnome.desktop.interface font-rgba-order 'rgba'
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
# gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro 10'
gsettings set org.gnome.desktop.interface show-battery-percentage true
# gsettings set org.gnome.desktop.peripherals.mouse speed '-0.25431034482758619'
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.preferences button-layout ':'
gsettings set org.gnome.desktop.wm.preferences num-workspaces 2

# eog
if command -v eog &> /dev/null; then
    gsettings set org.gnome.eog.fullscreen loop false
    gsettings set org.gnome.eog.fullscreen upscale false
    gsettings set org.gnome.eog.ui sidebar false
    gsettings set org.gnome.eog.view extrapolate false
    gsettings set org.gnome.eog.view use-background-color false
fi

# epiphany
if command -v epiphany &> /dev/null; then
    gsettings set org.gnome.Epiphany.state:/org/gnome/epiphany/state/ window-size '(1320, 1120)'
    # gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ language "['system', 'us']"
fi

# file-roller
if command -v file-roller &> /dev/null; then
    gsettings set org.gnome.FileRoller.UI window-height 940
    gsettings set org.gnome.FileRoller.UI window-width 820
fi

# gedit
if command -v gedit &> /dev/null; then
    gsettings set org.gnome.gedit.plugins.spell highlight-misspelled true
    gsettings set org.gnome.gedit.plugins active-plugins "['quickhighlight', 'spell', 'codecomment', 'git', 'colorpicker', 'smartspaces', 'docinfo', 'modelines', 'drawspaces', 'colorschemer', 'sort', 'multiedit', 'filebrowser', 'time', 'wordcompletion', 'bracketcompletion']"
    gsettings set org.gnome.gedit.preferences.editor display-right-margin true
    # gsettings set org.gnome.gedit.preferences.editor editor-font 'Source Code Pro 10'
    gsettings set org.gnome.gedit.preferences.editor insert-spaces true
    gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'
    gsettings set org.gnome.gedit.preferences.editor tabs-size 'uint32 4'
    # gsettings set org.gnome.gedit.preferences.editor use-default-font false
    gsettings set org.gnome.gedit.state.file-chooser open-recent false
    gsettings set org.gnome.gedit.state.window size '(960, 1000)'
fi

# gnome-system-monitor
if command -v gnome-system-monitor &> /dev/null; then
    gsettings set org.gnome.gnome-system-monitor current-tab 'resources'
    gsettings set org.gnome.gnome-system-monitor show-whose-processes 'all'
    gsettings set org.gnome.gnome-system-monitor window-height 924
    gsettings set org.gnome.gnome-system-monitor window-width 1104
fi

# mutter
if command -v mutter &> /dev/null; then
    gsettings set org.gnome.mutter center-new-windows true
    gsettings set org.gnome.mutter dynamic-workspaces false
fi

# file chooser and nautilus
if command -v nautilus &> /dev/null; then
    gsettings set org.gtk.gtk4.Settings.FileChooser sidebar-width 250
    gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true
    gsettings set org.gtk.gtk4.Settings.FileChooser window-size '(1200, 1000)'
    gsettings set org.gtk.Settings.FileChooser sidebar-width 250
    gsettings set org.gtk.Settings.FileChooser sort-directories-first true
    gsettings set org.gtk.Settings.FileChooser window-size '(1200, 1000)'
    gsettings set org.gnome.nautilus.window-state initial-size '(1040, 710)'
fi

# settings-daemon
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 3600

# shell
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.shell.window-switcher app-icon-mode 'app-icon-only'
gsettings set org.gnome.shell favorite-apps "['org.gnome.Epiphany.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.gedit.desktop']"
