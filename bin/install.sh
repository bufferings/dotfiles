#!/bin/bash
set -eu

dotdir=$(cd $(dirname $0)/..; pwd)

for f in $dotdir/.??*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".DS_Store" ] && continue

  ln -snfv "$f" "$HOME"/"$f"
done
