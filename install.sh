#!/bin/bash

set -e

if [ "$1" == "--dry-run" ]; then
  echo "Running in dry run mode"
  DRY_RUN="true"
else
  DRY_RUN="false"
fi

FILES_TO_IGNORE=("install.sh" "README.md" "LICENSE" ".gitignore" "stack" "lein" "vscode" "atom")


contains() {
  local match="$1"
  local element
  shift
  for element; do
    if [ "$element" == "$match" ]; then
      return 0
    fi
  done
  return 1
}

symlink() {
  local name="$1" target="$2"

  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    echo "Creating $target"

    # run if not in dry run
    if [ "${DRY_RUN}" != "true" ]; then
      ln -s "$PWD/$name" "$target"
    fi
  fi
}

symlink_all_files() {
  local name target

  for name in *; do
    if ! contains $name "${FILES_TO_IGNORE[@]}"; then
      target="$HOME/.$name"
      symlink $name $target
    fi
  done
}

# symlink all files (except ${FILES_TO_IGNORE})
symlink_all_files

# Create undo dir
UNDO_DIR=${HOME}/.vim/undo

if [ ! -d "${UNDO_DIR}" ]; then
  echo "Creating directory ${UNDO_DIR}"
  mkdir -p ${UNDO_DIR}
fi

# stack
STACK_HOME_DIR=${HOME}/.stack

if [ ! -d "${STACK_HOME_DIR}" ]; then
  echo "Creating directory ${STACK_HOME_DIR}"
  mkdir -p ${STACK_HOME_DIR}
fi

symlink "stack/config.yaml" "$STACK_HOME_DIR/config.yaml"

# lein
LEIN_HOME_DIR=${HOME}/.lein

if [ ! -d "${LEIN_HOME_DIR}" ]; then
  echo "Creating directory ${LEIN_HOME_DIR}"
  mkdir -p ${LEIN_HOME_DIR}
fi

symlink "lein/profiles.clj" "$LEIN_HOME_DIR/profiles.clj"

# VS Code
if [ "$(uname)" == "Darwin" ]; then
  VSCODE_SETTINGS_DIR="${HOME}/Library/Application Support/Code/User"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  VSCODE_SETTINGS_DIR=${HOME}/.config/Code/User
else
  echo "ERROR: Unable to setup VS Code because platform is unknown"
  exit 1
fi

if [ ! -d "${VSCODE_SETTINGS_DIR}" ]; then
  echo "Creating directory ${VSCODE_SETTINGS_DIR}"
  mkdir -p ${VSCODE_SETTINGS_DIR}
fi

symlink "vscode/settings.json" "${VSCODE_SETTINGS_DIR}/settings.json"
symlink "vscode/keybindings.json" "${VSCODE_SETTINGS_DIR}/keybindings.json"

# Atom
ATOM_HOME_DIR=${HOME}/.atom

if [ ! -d "${ATOM_HOME_DIR}" ]; then
  echo "Creating directory ${ATOM_HOME_DIR}"
  mkdir -p ${ATOM_HOME_DIR}
fi

symlink "atom/keymap.cson" "$ATOM_HOME_DIR/keymap.cson"
symlink "atom/config.cson" "$ATOM_HOME_DIR/config.cson"
symlink "atom/github.cson" "$ATOM_HOME_DIR/github.cson"
symlink "atom/packages.list" "$ATOM_HOME_DIR/packages.list"
