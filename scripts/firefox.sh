#!/bin/bash

# Say to firefox what it starts in the wayland enviroment
# Source: https://wiki.archlinux.org/title/Firefox#Wayland

echo "
if [ \"\$XDG_SESSION_TYPE\" == \"wayland\" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi" >> ~/.bash_profile

# Enabling vaapi support
# Sources:
# - https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
# - https://wiki.mozilla.org/Firefox/CommandLineOptions
# - https://askubuntu.com/questions/32631/how-to-configure-firefox-from-terminal

# I think here is the best way is creaeting an additional profile to the firefox
# and then setting it as a main profile, but I don't know the right way to
# manage them using the comand line. I know about installs.ini and profiles.ini,
# but changing them looks like a hack.

option="media.ffmpeg.vaapi.enabled"
path=$(realpath ~/.mozilla/firefox/*.default-release/prefs.js)

if grep $option $path
then
    sed -i -e "s/^user_pref(\"$option\", \(true\|false\));$/user_pref(\"$option\", true);/" $path
else
    echo "user_pref(\"$option\", true);" >> $path
fi

