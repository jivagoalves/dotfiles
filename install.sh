#!/bin/sh

set -e

UNDO_DIR=${HOME}/.vim/undo
STACK_HOME_DIR=${HOME}/.stack
LEIN_HOME_DIR=${HOME}/.lein

if [ ! -d "${UNDO_DIR}" ]; then
  echo "Creating directory ${UNDO_DIR}"
  mkdir -p ${UNDO_DIR}
fi

symlink(){
  name="$1"
  target="$2"

  if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'LICENSE' ] && [ "$name" != '.gitignore' ] && [ "$name" != 'stack' ] && [ "$name" != 'lein' ]; then
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
