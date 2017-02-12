# docker-vlc

Unofficial build of VLC 2.2.4, with audio support, running within a Docker container.

Derived from [chrisdaish/vlc](https://hub.docker.com/r/chrisdaish/vlc/) with the following enhancements:

* Switched from ubuntu:14.04 to debian:8 base container
* Upgraded 'vlc' to v2.2.4 (stable)
* Added 'vlc' user to 'audio' group in Dockerfile
* Improved 'start_vlc.sh' by chown'ing all of /home/vlc following uid:gid change vice just '~/.config' directory

Submitted a [pull request](https://github.com/chrisdaish/docker-vlc/pull/1) against the original repository, but a [fork](https://github.com/scottsideleau/docker-vlc) will be preserved at least until changes have been accepted upstream.

A launch script is recommended to be built/placed in /usr/local/lib with the following:

```
docker run \
  -v $HOME/Videos:/home/vlc/Documents:rw \
  -v $HOME/.pulse:/home/vlc/.pulse:rw \
  -v /dev/shm:/dev/shm \
  -v /dev/snd:/dev/snd --privileged \
  -v /var/lib/dbus:/var/lib/dbus \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e uid=$(id -u) -e gid=$(id -g) \
  -e DISPLAY=unix$DISPLAY --name docker-vlc \
  scottsideleau/vlc
```

The implementation has been verified on both Red Hat Enterprise Linux (RHEL) 6.8 and Ubuntu LTS 16.04 workstations.
