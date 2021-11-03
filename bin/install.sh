#!/bin/bash
set -eu

dotdir=$(cd $(dirname $0)/..; pwd)

for f in $dotdir/.??*; do
  [[ `basename $f` == ".git" ]] && continue
  [[ `basename $f` == ".DS_Store" ]] && continue

  ln -snfv "$f" $HOME
done
