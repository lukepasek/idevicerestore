#!/bin/sh
_CMD=$@
echo "Starting usbmux deamon ($(usbmuxd -V))"
while true; do usbmuxd -f --verbose --logfile=/var/log/usbmuxd.log --enable-exit; sleep 1; done &
echo "  usbmuxd verbose output is logged to /var/log/usbmuxd.log"
echo "  use usbmuxd --exit to restart"
exec $_CMD
