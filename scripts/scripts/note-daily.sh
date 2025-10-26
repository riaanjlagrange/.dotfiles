#!/bin/bash
# Attach to the notes tmux session and trigger daily note

tmux has-session -t notes 2>/dev/null || tmux new-session -d -s notes -n main
tmux select-window -t notes:2
tmux send-keys -t notes:2 " " n d
