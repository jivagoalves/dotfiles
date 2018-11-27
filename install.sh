#!/bin/sh

set -e

UNDO_DIR=${HOME}/.vim/undo
STACK_HOME_DIR=${HOME}/.stack
LEIN_HOME_DIR=${HOME}/.lein
if [ "$(uname)" == "Darwin" ]; then
  VSCODE_SETTINGS_DIR="${HOME}/Library/Application Support/Code/User"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  VSCODE_SETTINGS_DIR=${HOME}/.config/Code/User
else
  echo "ERROR: Unable to setup VS Code because platform is unknown"
  exit 1
fi

if [ ! -d "${UNDO_DIR}" ]; then
  echo "Creating directory ${UNDO_DIR}"
  mkdir -p ${UNDO_DIR}
fi

symlink(){
  name="$1"
  target="$2"

  if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'LICENSE' ] && [ "$name" != '.gitignore' ] && [ "$name" != 'stack' ] && [ "$name" != 'lein' ] && [ "$name" != 'vscode' ]; then
    if [ -e "$target" ]; then
      if [ ! -L "$target" ]; then
        echo "WARNING: $target exists but is not a symlink."
      fi
    else
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
}

for name in *; do
  target="$HOME/.$name"

  symlink $name $target
done

# stack
if [ ! -d "${STACK_HOME_DIR}" ]; then
  echo "Creating directory ${STACK_HOME_DIR}"
  mkdir -p ${STACK_HOME_DIR}
fi

symlink "stack/config.yaml" "$STACK_HOME_DIR/config.yaml"

# lein
if [ ! -d "${LEIN_HOME_DIR}" ]; then
  echo "Creating directory ${LEIN_HOME_DIR}"
  mkdir -p ${LEIN_HOME_DIR}
fi

symlink "lein/profiles.clj" "$LEIN_HOME_DIR/profiles.clj"

# VS Code
if [ ! -d "${VSCODE_SETTINGS_DIR}" ]; then
  echo "Creating directory ${VSCODE_SETTINGS_DIR}"
  mkdir -p ${VSCODE_SETTINGS_DIR}
fi

symlink "vscode/settings.json" "${VSCODE_SETTINGS_DIR}/settings.json"
symlink "vscode/keybindings.json" "${VSCODE_SETTINGS_DIR}/keybindings.json"
