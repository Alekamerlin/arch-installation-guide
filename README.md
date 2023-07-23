# arch-installation-guide
A quick installation guide with automation scripts for Arch Linux.

### Bluetooth

Install the necessary packages:
```
# pacman -S bluez bluez-utils
```

Check whether the bluetooth module is loaded:
```
$ modinfo btusb
```

If so, enable and then start the bluetooth service:
```
# systemctl enable bluetooth.service

# systemctl start bluetooth.service
```

### Gnome DE

Install gnome packages:
```
# pacman -S gdm gnome-shell gnome-desktop gnome-calculator gnome-characters gnome-control-center gnome-disk-utility gnome-font-viewer gnome-sound-recorder gnome-system-monitor gnome-terminal gnome-bluetooth-3.0 epiphany totem evince eog gedit gedit-plugins gucharmap libgit2-glib dconf-editor
```

Enable `gdm.service`:
```
# systemctl enable gdm.service
```

Reboot the system and launch the gsettings script for each your user:
```
$ sh scripts/gsettings.sh
```

### Firefox

Install Firefox:
```
# pacman -S firefox
```

Launch it, close it and run a script from the **scripts** directory:
```
$ sh scripts/firefox.sh
```

Do it for each your user and then reboot the system.

