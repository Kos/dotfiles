#!/bin/bash
set -e
FILES=`find \( -type f -o -type l \) -not -path "./.git/*" -not -name link.sh`
IFS=$'\n'
for i in $FILES; do
  $CMD mkdir -p ~/`dirname $i`
  if [ -L ~/$i ]; then
    true # ignore - already linked
  elif [ -e ~/$i ]; then
    echo "Igoring $i: (already exists as a file)"
  else
    $CMD ln -v -s ~/dotfiles/$i ~/$i
  fi
done
