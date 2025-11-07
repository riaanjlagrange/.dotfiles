#!/bin/sh
cliphist list | wofi --dmenu | cliphist decode | wl-copy && wtype -M ctrl v -m ctrl

