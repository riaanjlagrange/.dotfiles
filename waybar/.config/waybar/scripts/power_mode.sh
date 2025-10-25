#!/usr/bin/env bash

STATE_FILE="$HOME/.cache/power_mode"

# Initialize if not exists
if [[ ! -f "$STATE_FILE" ]]; then
    echo "balanced" > "$STATE_FILE"
fi

current_mode=$(cat "$STATE_FILE")

# Toggle if requested
if [[ "$1" == "toggle" ]]; then
    case "$current_mode" in
        performance) new_mode="balanced" ;;
        balanced) new_mode="power-saver" ;;
        power-saver) new_mode="performance" ;;
    esac
    echo "$new_mode" > "$STATE_FILE"

    # Apply power profile
    if command -v powerprofilesctl &>/dev/null; then
        powerprofilesctl set "$new_mode"
    fi

    current_mode="$new_mode"
fi

# Set icon and CSS class
case "$current_mode" in
    performance) css_class="performance" ;;
    balanced) css_class="balanced" ;;
    power-saver) css_class="powersaver" ;;
esac

# Output JSON for Waybar
echo "{\"text\": \"$icon $current_mode\", \"class\": \"$css_class\", \"tooltip\": \"Power mode: $current_mode\"}"

