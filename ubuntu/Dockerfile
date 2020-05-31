from ubuntu:20.04

env DEBIAN_FRONTEND=noninteractive

run mkdir -p /usr/src /run
copy *.patch /usr/src/

run apk update && apk add --no-cache \
git \
build-base \
make \
automake \
autoconf \
libtool \
pkgconf \
openssl \
curl \
libusb \
libzip \
readline \
openssl-dev \
curl-dev \
libusb-dev \
libzip-dev \
python-dev \
readline-dev

run git clone https://github.com/libimobiledevice/libplist.git /usr/src/libplist
workdir /usr/src/libplist
run ./autogen.sh && make && make install clean

run git clone https://github.com/libimobiledevice/libusbmuxd.git /usr/src/libusbmuxd
workdir /usr/src/libusbmuxd
run patch tools/iproxy.c ../libusbmuxd_tools_iproxy_c.patch
run ./autogen.sh && make && make install clean

run git clone https://github.com/libimobiledevice/libimobiledevice.git /usr/src/libimobiledevice
workdir /usr/src/libimobiledevice
run ./autogen.sh && make && make install clean

run git clone https://github.com/libimobiledevice/usbmuxd.git /usr/src/usbmuxd
workdir /usr/src/usbmuxd
run ./autogen.sh && make && make install clean

run git clone https://github.com/libimobiledevice/libirecovery.git /usr/src/libirecovery
workdir /usr/src/libirecovery
run ./autogen.sh && make && make install clean

run git clone https://github.com/libimobiledevice/idevicerestore.git /usr/src/idevicerestore
workdir /usr/src/idevicerestore
run ./autogen.sh && make && make install clean

workdir /run
run rm -rf /usr/src
run apk del git build-base make automake autoconf libtool pkgconf openssl-dev curl-dev libusb-dev libzip-dev python-dev readline-dev
cmd [ "/bin/bash" ]
