#!/bin/sh

UNDO_DIR=${HOME}/.vim/undo

if [ ! -d "${UNDO_DIR}" ]; then
  echo "Creating directory ${UNDO_DIR}"
  mkdir -p ${UNDO_DIR}
fi

for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'LICENSE' ] && [ "$name" != '.gitignore' ]; then
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done
