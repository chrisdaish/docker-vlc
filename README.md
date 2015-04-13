VLC
===

Unofficial build of VLC 2.1.4 running within a docker container and rendered by the local X Server.

Changelog
---------
```
v1.1
* Added audio passthrough, however this requires the --privileged argument to be set. This should be used with caution.

* Additional configuration files can now be mounted inside the container (see example below).
I have included the vlcrc in my [GitHub](https://github.com/chrisdaish/docker-vlc/tree/master/configFiles).

v1.0
* User permissions now correlate between host and container. This allows VLC media to be saved back to the host system by passing in the local users uid/gid as environment variables.
```

Launch Command
---------------
```
docker run -v $HOME/Documents:/home/vlc/Documents:rw -v /dev/snd:/dev/snd --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --name vlc chrisdaish/vlc
```

Additional config example:

```
docker run -v $HOME/Documents:/home/vlc/Documents:rw -v $HOME/<pathToConfigFiles>/vlcrc:/home/vlc/.config/vlc/vlcrc:ro -v /dev/snd:/dev/snd --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --name vlc chrisdaish/vlc
```

FAQ
---
Note: If you receive the following Gtk error:

```
Gtk-WARNING **: cannot open display: unix:0.0
```
Simply allow the docker user to communicate with your X session

```
xhost +local:docker
```
