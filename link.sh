#!/bin/bash -e
FILES=`find \( -type f -o -type l \) -not -path "./.git/*" -not -name link.sh`
IFS=$'\n'
for i in $FILES; do
    $CMD mkdir -p ~/`dirname $i`
    $CMD ln -v -s ~/dotfiles/$i ~/$i || true
done
