#!/bin/sh

set -e

UNDO_DIR=${HOME}/.vim/undo
STACK_HOME_DIR=${HOME}/.stack

if [ ! -d "${UNDO_DIR}" ]; then
  echo "Creating directory ${UNDO_DIR}"
  mkdir -p ${UNDO_DIR}
fi

symlink(){
  name="$1"
  target="$2"

  if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'LICENSE' ] && [ "$name" != '.gitignore' ] && [ "$name" != 'stack' ]; then
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

symlink "stack/config.yml" "$STACK_HOME_DIR/config.yml"
