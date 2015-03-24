#!/bin/bash
groupmod -g $gid vlc
usermod -u $uid -g $gid vlc

if [ -d /home/vlc/.config ]; then
  chown -R vlc:vlc /home/vlc/.config
fi

exec su -ls "/bin/bash" -c "mkdir -p /home/vlc/.local/share; /usr/bin/vlc" vlc
