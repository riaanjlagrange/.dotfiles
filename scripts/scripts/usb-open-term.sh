#!/bin/bash

EVENT="$1"
MOUNT="$2"
PIDFILE="/tmp/usb-kitty.pid"

# Open terminal on mount
if [ "$EVENT" = "device_mounted" ] && [ -n "$MOUNT" ]; then
    kitty --directory "$MOUNT" &
    echo $! > "$PIDFILE"
    exit 0
fi

# Close terminal on remove
if [ "$EVENT" = "device_removed" ] && [ -f "$PIDFILE" ]; then
    kill "$(cat "$PIDFILE")" 2>/dev/null
    rm -f "$PIDFILE"
fi

