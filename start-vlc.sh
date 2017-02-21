#!/bin/bash
groupmod -g $gid vlc
usermod -u $uid -g $gid vlc
chown --recursive vlc:vlc /home/vlc

exec su --login \
        --shell "/bin/bash" \
        --command "mkdir -p /home/vlc/.local/share; \
                   /usr/bin/vlc $ARGS $FILE" \
     vlc
