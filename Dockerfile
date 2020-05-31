from ubuntu:20.04

env DEBIAN_FRONTEND=noninteractive

add http://www.linux-usb.org/usb.ids /usr/share/hwdata/usb.ids
run mkdir -p /usr/src/

run apt-get update
run apt-get -y install git make automake autoconf libtool pkg-config usbutils

run apt-get -y install \
	libreadline-dev \
	libusb-1.0 \
	libimobiledevice-dev \
	libzip-dev \ 
	libssl-dev \
	libcurl4-openssl-dev
run apt-get -y install usbmuxd

workdir /usr/src
run git clone https://github.com/libimobiledevice/libirecovery.git
run git clone https://github.com/libimobiledevice/idevicerestore.git

workdir /usr/src/libirecovery
run ./autogen.sh && make && make install

workdir /usr/src/idevicerestore
run ./autogen.sh && make && make install

run ldconfig
