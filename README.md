_Please note that this is a work in progress container, and it requires some cleanup work._

Docker container for the excellent _libimobiledevice/idevicerestore/ideviceactivate_ tools "A cross-platform protocol library to communicate with iOS devices" from https://github.com/libimobiledevice ( https://libimobiledevice.org ).

This is an unmodified build from git (and some git tags).

**Note:** Before running the container make sure that `usbmuxd` is NOT running on the host, better yet remove/uninstall it, as it's started automatically by an udev rule when Apple device is connected/restarted.

Run (to get bash prompt): 
```
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb --net=host lukepasek/idevicerestore:latest
```
(`net: host` is  for some strange reason required to receive hotplug events in the container)

The usbmuxd daemon is started automatically in the background on the container start.

Finally, run any of the `idevice*` commands, or other `i*` commands such as `irecovery`.

The container can be also run in command mode:
```
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb --net=host lukepasek/idevicerestore:latest ideviceinfo
```

Optionally the container can be run with a host mounted volume to allow for downloaded image caching:
```
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb -v /tmp/idevicerestore_cache/:/tmp/idevicerestore_cache/ --net=host lukepasek/idevicerestore:latest
```
In such case, the `idevicerestore` command can be run with the `-C /tmp/idevicerestore_cache/` option.
