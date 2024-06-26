#!/bin/bash

sidebar_width=250

window_height=1000
window_height_big=1010

window_width=800
window_width_big=1130
window_width_large=1200

tab_width=4

# calculator
if command -v gnome-calculator &> /dev/null; then
    gsettings set org.gnome.calculator show-thousands true
fi

# console
if command -v kgx &> /dev/null; then
    gsettings set org.gnome.Console last-window-size "($window_width, $window_height)"
fi

# control-center
if command -v gnome-control-center &> /dev/null; then
    gsettings set org.gnome.Settings window-state "($window_width_big, $window_height_big, false)"
fi

# dconf-editor
if command -v dconf-editor &> /dev/null; then
    gsettings set ca.desrt.dconf-editor.Lib:/ca/desrt/dconf-editor/ window-height $window_height
    gsettings set ca.desrt.dconf-editor.Lib:/ca/desrt/dconf-editor/ window-width $window_width
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
gsettings set org.gnome.desktop.peripherals.mouse speed '-0.2'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'minimize'
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
    gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ show-developer-actions true
fi

# extensions
if command -v gnome-extensions &> /dev/null; then
    gsettings set org.gnome.Extensions window-height $window_height
    gsettings set org.gnome.Extensions window-width $window_width
fi

# file-roller
if command -v file-roller &> /dev/null; then
    gsettings set org.gnome.FileRoller.Dialogs.Add height $window_height
    gsettings set org.gnome.FileRoller.Dialogs.Add width $window_width_large
    gsettings set org.gnome.FileRoller.Dialogs.Extract height $window_height
    gsettings set org.gnome.FileRoller.Dialogs.Extract width $window_width_large
    gsettings set org.gnome.FileRoller.Dialogs.LastOutput height $window_height
    gsettings set org.gnome.FileRoller.Dialogs.LastOutput width $window_width_large
    gsettings set org.gnome.FileRoller.FileSelector sidebar-size $sidebar_width
    gsettings set org.gnome.FileRoller.UI window-height $window_height
    gsettings set org.gnome.FileRoller.UI window-width $window_width
fi

# gedit
if command -v gedit &> /dev/null; then
    gsettings set org.gnome.gedit.plugins.spell highlight-misspelled true
    gsettings set org.gnome.gedit.plugins active-plugins "['quickhighlight', 'spell', 'codecomment', 'git', 'colorpicker', 'smartspaces', 'docinfo', 'modelines', 'drawspaces', 'colorschemer', 'sort', 'multiedit', 'filebrowser', 'time', 'wordcompletion', 'bracketcompletion']"
    gsettings set org.gnome.gedit.preferences.editor display-right-margin true
    # gsettings set org.gnome.gedit.preferences.editor editor-font 'Source Code Pro 10'
    gsettings set org.gnome.gedit.preferences.editor insert-spaces true
    gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'
    gsettings set org.gnome.gedit.preferences.editor tabs-size "uint32 $tab_width"
    # gsettings set org.gnome.gedit.preferences.editor use-default-font false
    gsettings set org.gnome.gedit.state.file-chooser open-recent false
    gsettings set org.gnome.gedit.state.window size "($window_width, $window_height)"
fi

# gnome-system-monitor
if command -v gnome-system-monitor &> /dev/null; then
    gsettings set org.gnome.gnome-system-monitor current-tab 'resources'
    gsettings set org.gnome.gnome-system-monitor show-whose-processes 'all'
    gsettings set org.gnome.gnome-system-monitor window-height $window_height_big
    gsettings set org.gnome.gnome-system-monitor window-width $window_width_big
fi

# mutter
if command -v mutter &> /dev/null; then
    gsettings set org.gnome.mutter center-new-windows true
    gsettings set org.gnome.mutter dynamic-workspaces false
fi

# file chooser and nautilus
if command -v nautilus &> /dev/null; then
    gsettings set org.gtk.gtk4.Settings.FileChooser sidebar-width $sidebar_width
    gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true
    gsettings set org.gtk.gtk4.Settings.FileChooser window-size "($window_width_large, $window_height)"
    gsettings set org.gtk.Settings.FileChooser sidebar-width $sidebar_width
    gsettings set org.gtk.Settings.FileChooser sort-directories-first true
    gsettings set org.gtk.Settings.FileChooser window-size "($window_width_large, $window_height)"
    gsettings set org.gnome.nautilus.preferences show-create-link true
    gsettings set org.gnome.nautilus.window-state initial-size '(980, 620)'
fi

# settings-daemon
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 3600

# shell
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.shell.window-switcher app-icon-mode 'app-icon-only'
gsettings set org.gnome.shell disabled-extensions "['auto-move-windows@gnome-shell-extensions.gcampax.github.com', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'light-style@gnome-shell-extensions.gcampax.github.com', 'native-window-placement@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'window-list@gnome-shell-extensions.gcampax.github.com', 'windowsNavigator@gnome-shell-extensions.gcampax.github.com', 'workspace-indicator@gnome-shell-extensions.gcampax.github.com', 'system-monitor@gnome-shell-extensions.gcampax.github.com']"
gsettings set org.gnome.shell enabled-extensions "['drive-menu@gnome-shell-extensions.gcampax.github.com']"
if command -v epiphany &> /dev/null &&
    command -v nautilus &> /dev/null &&
    command -v gnome-calculator &> /dev/null &&
    command -v kgx &> /dev/null &&
    command -v gnome-text-editor &> /dev/null; then
    gsettings set org.gnome.shell favorite-apps "['org.gnome.Epiphany.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Console.desktop', 'org.gnome.TextEditor.desktop']"
elif command -v epiphany &> /dev/null &&
    command -v nautilus &> /dev/null &&
    command -v gnome-calculator &> /dev/null &&
    command -v gnome-terminal &> /dev/null &&
    command -v gedit &> /dev/null; then
    gsettings set org.gnome.shell favorite-apps "['org.gnome.Epiphany.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.gedit.desktop']"
fi

# text-editor
if command -v gnome-text-editor &> /dev/null; then
    gsettings set org.gnome.TextEditor draw-spaces "['space', 'tab', 'nbsp', 'leading', 'text', 'trailing']"
    gsettings set org.gnome.TextEditor highlight-current-line true
    gsettings set org.gnome.TextEditor indent-style 'space'
    gsettings set org.gnome.TextEditor restore-session false
    gsettings set org.gnome.TextEditor show-line-numbers true
    gsettings set org.gnome.TextEditor show-right-margin true
    gsettings set org.gnome.TextEditor style-variant 'dark'
    gsettings set org.gnome.TextEditor tab-width $tab_width
fi
