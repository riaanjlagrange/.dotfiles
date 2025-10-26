#!/bin/bash
# Attach to the notes tmux session and trigger new note

# Ensure the tmux session exists
tmux has-session -t notes 2>/dev/null || tmux new-session -d -s notes -n main

# Focus window 1 (your notes window)
tmux select-window -t notes:1

# Send keystroke to Neovim inside tmux to trigger your "new note" shortcut
# Example assumes your Neovim "create note" keybind is <Leader>nn
tmux send-keys -t notes:1 " " n n
