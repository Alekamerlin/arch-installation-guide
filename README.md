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

### Portals

Install packages to support Wayland portals for screen sharing as an example:
```
# pacman -S xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-gnome
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

### Chromium

Sources:
- https://wiki.archlinux.org/title/Chromium#Hardware_video_acceleration
- https://wiki.archlinux.org/title/Arch_User_Repository

Build and install the Wayland version of Chromium with VA-API support from the AUR:
```
$ git clone https://aur.archlinux.org/chromium-wayland-vaapi.git

$ ch chromium-wayland-vaapi

$ makepkg

# pacman -U chromium-wayland-vaapi-*-x86_64.pkg.tar.zst
```

This might be enough, but if hardware decoding doesn't work, try to enbaling `VaapiVideoDecoder`:
```
echo "--enable-features=VaapiVideoDecoder" >> ~/.config/chromium-flags.conf
```

### VSCodium

Install the necessary packages:
```
# pacman -S jq git-lfs gulp yarn
```

Build and install the nvm package:
```
$ git clone https://aur.archlinux.org/nvm.git

$ cd nvm

$ makepkg

# pacman -U nvm-*-any.pkg.tar.zst
```

Build and install the VSCodium package:
```
$ cd ../

$ git clone https://aur.archlinux.org/vscodium.git

$ cd vscodium

$ makepkg

# pacman -U vscodium-*-x86_64.pkg.tar.zst
```

For further reading about Wayland support:
- https://github.com/VSCodium/vscodium/discussions/1098
- https://github.com/microsoft/vscode/issues/168620

