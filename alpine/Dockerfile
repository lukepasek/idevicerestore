from alpine:latest as build

run mkdir -p /usr/src /run
copy *.patch /usr/src/
copy init.sh /usr/src/
run chmod +x /usr/src/init.sh

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

run git clone https://github.com/libimobiledevice/libplist.git /usr/src/libplist && \
cd /usr/src/libplist && \
./autogen.sh && make && make install 

run git clone https://github.com/libimobiledevice/libusbmuxd.git /usr/src/libusbmuxd && \
cd /usr/src/libusbmuxd && \
patch tools/iproxy.c /usr/src/libusbmuxd_tools_iproxy_c.patch && \
./autogen.sh && make && make install

run git clone https://github.com/libimobiledevice/libimobiledevice.git /usr/src/libimobiledevice && \
cd /usr/src/libimobiledevice && \
./autogen.sh && make && make install

run git clone https://github.com/libimobiledevice/usbmuxd.git /usr/src/usbmuxd && \
cd /usr/src/usbmuxd && \
./autogen.sh && make && make install

run git clone https://github.com/libimobiledevice/libirecovery.git /usr/src/libirecovery && \
cd /usr/src/libirecovery && \
./autogen.sh && make && make install

run git clone https://github.com/libimobiledevice/idevicerestore.git /usr/src/idevicerestore && \
cd /usr/src/idevicerestore && \
./autogen.sh && make && make install 

FROM alpine:latest
COPY --from=build /usr/src/init.sh /init.sh
COPY --from=build /usr/local/ /usr/local/
RUN apk update && apk add --no-cache \
bash \
openssl \
libcurl \
libusb \
libzip \
readline
ENTRYPOINT [ "/bin/bash", "/init.sh" ]
CMD [ "/bin/bash" ]
