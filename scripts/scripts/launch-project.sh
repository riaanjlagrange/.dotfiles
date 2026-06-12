#!/usr/bin/env bash

set -e

PROJECT="$1"
WORK_DIR="$HOME/work"
PROJECT_DIR="$WORK_DIR/projects/$PROJECT"
NOTES_FILE="$PROJECT_DIR/notes.md"
NOTES_TEMPLATE="$WORK_DIR/notes-template.md"

# copy notes template if it doesn't have a notes file
if [[ ! -f "$NOTES_FILE" ]]; then
  cp "$NOTES_TEMPLATE" "$NOTES_FILE"

  # replace placeholder with project name
  sed -i "s/{{PROJECT}}/$PROJECT/g" "$NOTES_FILE"
fi

# check if tmux session already exists
if ! tmux has-session -t "$PROJECT" 2>/dev/null; then
  # create new session if it doesnt
  tmux new-session \
    -d \
    -s "$PROJECT" \
    -c "$PROJECT_DIR"

  # create dev window
  tmux rename-window \
    -t "$PROJECT" \
    "dev"

  tmux send-keys \
    -t "$PROJECT" \
    "nvim ." \
    C-m

  # create terminal window
  tmux new-window \
    -t "$PROJECT" \
    -n cli \
    -c "$PROJECT_DIR"

  # create notes window
  tmux new-window \
    -t "$PROJECT" \
    -n notes \
    -c "$PROJECT_DIR" \
    "nvim notes.md"
fi

# attach to tmux session
tmux select-window -t "$PROJECT":dev
tmux attach -t "$PROJECT"
