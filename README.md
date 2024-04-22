# arch-installation-guide
A quick installation guide with automation scripts for Arch Linux.

### Prepare an installation disk

Download the ISO image and its signature and checksum (archlinux-x86\_64.iso, archlinux-x86\_64.iso.sig, b2sums.txt) from the Download page: https://archlinux.org/download/.

> Use the commands below in the directory where you downloaded the files.

Verify the checksum of the downloaded ISO image:
```
$ b2sum -c b2sums.txt
```

Verify the signature of the downloaded ISO image:
```
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-x86_64.iso.sig
```

Create an installation USB drive:
```
# dd bs=4M if=archlinux-x86_64.iso of=/dev/sdb conv=fsync oflag=direct status=progress
```
Where `/dev/sdb` is your USB drive you want to use as the installation drive.

To boot an installation image from a USB drive, you should disable Secure Boot on the computer you will boot the image from, because the installation image doesn't support Secure Boot.

Check the boot mode after booting the installation image:
```
# ls /sys/firmware/efi/efivars
```
The command will print directory items if you booted in UEFI mode. This guide is only for UEFI mode, so you should check the current mode.

### Prepare a system disk

Create a partition table:
```
# parted /dev/sda mklabel gpt
```
Where `/dev/sda` is the SDD/HDD drive you want to install Arch.

Create parts:
```
# parted /dev/sda mkpart EFI fat32 1M 525M

# parted /dev/sda mkpart root ext4 525M 105GB

# parted /dev/sda mkpart swap linux-swap 105GB 160GB

# parted /dev/sda mkpart home ext4 160GB 260GB

# parted /dev/sda mkpart media ext4 260GB 512GB
```

> For SSD the order of the parts doesn't matter, but for HDD it does.

> I usually create the media part because I use few accounts on the same computer, so the media is a place for common files like music and photos.

Format partitions:
```
# mkfs.fat -F 32 /dev/sda1

# mkfs.ext4 /dev/sda2

# mkswap /dev/sda3

# mkfs.ext4 /dev/sda4

# mkfs.ext4 /dev/sda5
```

### Prepare to installation

Connect to the internet (the easiest way is DHCP) and test the connection:
```
# ping duckduckgo.com
```

Mount the system disk:
```
# mount /dev/sda2 /mnt

# mount --mkdir /dev/sda1 /mnt/boot

# mount --mkdir /dev/sda4 /mnt/home
```

Enable swap:
```
# swapon /dev/sda3
```

Update the system clock:
```
# timedatectl
```

### Installation

Install main packages:
```
# pacstrap -K /mnt base base-devel linux linux-firmware grub-install dhcpcd vim
```

### Configure the system

Generate an `fstab` file:
```
# genfstab -U /mnt >> /mnt/etc/fstab
```

Enter to the new system as root:
```
# arch-chroot /mnt
```

Create a password to the system root:
```
# passwd
```

Install `grub`:
```
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```

Set the time zone:
```
# ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
```
Where `Europe/Amsterdam` is your region and city.

Set up the hardware clock:
```
# hwclock --systohc
```

Create the hostname file:
```
# echo machinename > /etc/hostname
```
Where `machinename` is your hostname (the name of your PC).

Uncomment `en_US.UTF-8 UTF-8` and other required locales in `/etc/locale.gen`:
```
# vim /etc/locale.gen
```

Save the file and generate locales:
```
# locale-gen
```

Set up the system locale:
```
# localectl set-locale LANG=en_US.UTF-8
```

Reboot the PC:
```
# reboot
```

Boot the new installed system and enable the `dhcpcd` service:
```
# systemctl enable dhcpcd.service
```

Connect to the internet via DHCP and test the connection:
```
# ping duckduckgo.com
```

### Video

Install packages to support 3D acceleration and VA-API for Intel graphics:
```
# pacman -S mesa vulkan-intel intel-media-driver xf86-video-intel
```

> `xf86-video-intel` not recommended.

### Audio

Install packages to support audio on the system:
```
# pacman -S sof-firmware pipewire pipewire-audio pipewire-jack pipewire-pulse wireplumber
```

> Use `alsa-firmware` instead of `sof-firmware` for older sound systems.

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

### Webcam

Your webcam probably works out of the box, if not, check the manual: https://wiki.archlinux.org/title/Webcam_setup

Install `v4l-utils` for webcam configuration (brightness, effects etc):
```
# pacman -S v4l-utils
```

Or `cameractrls`:
```
# pacman -S cameractrls
```

### Multimedia

Install the multimedia framework and its plugins:
```
# pacman -S gstreamer gstreamer-vaapi gst-libav gst-plugin-pipewire gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly
```

### Users

Create a user:
```
# useradd -m user_name
```

Set a password for the new user:
```
# passwd user_name
```

Install `xdg-user-dirs` to manage user directories:
```
# pacman -S xdg-user-dirs
```

Create user directories:
```
# su user_name

$ xdg-user-dirs-update

$ exit
```
Repeat this for each created user.

### Gnome DE

Install gnome packages:
```
# pacman -S gdm gnome-shell gnome-desktop gnome-calculator gnome-characters gnome-control-center gnome-disk-utility gnome-font-viewer gnome-sound-recorder gnome-system-monitor gnome-terminal gnome-bluetooth-3.0 epiphany totem evince eog gedit gedit-plugins gucharmap libgit2-glib gst-plugin-gtk dconf-editor
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

### Thumbnails

Install packages to provide thumbnail preview:
```
# pacman -S tumbler webp-pixbuf-loader ffmpegthumbnailer libgsf gnome-epub-thumbnailer freetype2
```

### Media devices & online storages

For support MTP (Android phones, tablets and music players) install `gvfs-mtp`:
```
# pacman -S gvfs-mtp
```

For support PTP (digital cameras and smartphone photos) install `gvfs-gphoto2`:
```
# pacman -S gvfs-gphoto2
```

For support iOS (iPhone and iPad) install `gvfs-afc`:
```
# pacman -S gvfs-afc ifuse
```

For support NFS (Network File System) install `gvfs-nfs`:
```
# pacman -S gvfs-nfs
```

For support SMB/CIFS (Server Message Block/Common Internet File System) install `gvfs-smb`:
```
# pacman -S gvfs-smb
```

For support virtual filesystems (e.g. OwnCloud) install `gvfs-goa`:
```
# pacman -S gvfs-goa
```

For support Google Drive install `gvfs-google`:
```
# pacman -S gvfs-google
```

For support Microsoft OneDrive install `gvfs-onedrive`:
```
# pacman -S gvfs-onedrive
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

> Sources:
> - https://wiki.archlinux.org/title/Chromium#Hardware_video_acceleration
> - https://wiki.archlinux.org/title/Arch_User_Repository

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

> Sources:
> - https://wiki.archlinux.org/title/Visual_Studio_Code
> - https://wiki.archlinux.org/title/Wayland#Electron
> - https://wiki.archlinux.org/title/Arch_User_Repository

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

Add `--enable-features=WaylandWindowDecorations --ozone-platform-hint=auto` to the `Exec` command in the files:
- /usr/share/applications/vscodium.desktop
- /usr/share/applications/vscodium-uri-handler.desktop

