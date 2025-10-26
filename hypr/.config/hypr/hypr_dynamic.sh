#!/usr/bin/env bash

# Determine the machine
HOST=$(cat /etc/hostname)

# Output path for dynamic config
DYN_CONF="$HOME/.config/hypr/hypr_dynamic.conf"

if [[ "$HOST" == "mainarch" ]]; then
    # On main PC, source monitors and workspaces
    cat > "$DYN_CONF" <<EOF
source = $HOME/.config/hypr/monitors.conf
source = $HOME/.config/hypr/workspaces.conf
EOF
else
    # On laptop, use default preferred monitor
    cat > "$DYN_CONF" <<EOF
monitor=,preferred,auto,auto
EOF
fi
