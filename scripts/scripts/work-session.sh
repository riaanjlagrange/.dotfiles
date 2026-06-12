#!/usr/bin/env bash

set -e

PROJECT_ROOT="$HOME/work/projects"
STATE_DIR="$HOME/.workstate"

mkdir -p "$PROJECT_ROOT"
mkdir -p "$STATE_DIR"

LAST_PROJECT=""

# if current project exists, update the LAST_PROJECT variable to it
if [[ -f "$STATE_DIR/current_project" ]]; then
  LAST_PROJECT=$(cat "$STATE_DIR/current_project")
fi

# array for projects to select from
PROJECTS=()

# if there is a last project, the give the option to continue with it
if [[ -n "$LAST_PROJECT" ]]; then
  PROJECTS+=("CONTINUE::$LAST_PROJECT")
fi

PROJECTS+=("NEW")

while IFS= read -r dir; do
  PROJECTS+=("$(basename "$dir")")
  
done < <(
  find "$PROJECT_ROOT" \
    -mindepth 1 \
    -maxdepth 1 \
    -type d \
    | sort
)


# handle selection

# format list with fzf
SELECTION=$(
  printf '%s\n' "${PROJECTS[@]}" |
    fzf \
      --height=30% \
      --border \
      --prompt="> "
)


[[ -z "$SELECTION" ]] && exit 0

case "$SELECTION" in
  "CONTINUE::"*)
    PROJECT="${SELECTION#CONTINUE::}"
    ;;

  "NEW")

    read -rp "Project Name: " PROJECT
    read -rp "GitHub URL (optional): " REPO

    mkdir -p "$PROJECT_ROOT/$PROJECT"

    if [[ -n "$REPO" ]]; then
      git clone "$REPO" "$PROJECT_ROOT/$PROJECT/$PROJECT"
    fi
    ;;

  *)
    PROJECT="$SELECTION"
    ;;
esac

# save project to last project
echo "$PROJECT" > "$STATE_DIR/current_project"

# launch the project
"$HOME/scripts/launch-project.sh" "$PROJECT"
