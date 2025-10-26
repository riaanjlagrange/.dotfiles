#!/usr/bin/env bash

LOCK_FILE="/tmp/nosleep.lock"
TIMEOUT=2000

if [[ -f "$LOCK_FILE" ]]; then
    rm "$LOCK_FILE"
    notify-send -t $TIMEOUT "sleep enabled"
else
    touch "$LOCK_FILE"
    notify-send -t $TIMEOUT "sleep disabled"
fi
