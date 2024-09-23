#!/bin/bash
set -e

if [ ! -f /etc/neko/xorg.conf ]; then
    cat <<EOF > /etc/neko/xorg.conf
Section "Device"
    Identifier "Device0"
    Driver "amdgpu"
    Option "AccelMethod" "glamor"
    Option "DRI" "3"
EndSection

Section "Monitor"
    Identifier "Monitor0"
EndSection

Section "Screen"
    Identifier "Screen0"
    Device "Device0"
    Monitor "Monitor0"
    DefaultDepth 24
    SubSection "Display"
        Depth 24
        Modes "1920x1080"
    EndSubSection
EndSection
EOF
fi

exec "$@"
