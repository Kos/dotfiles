#!/bin/bash
sudo apt install fzf wget curl httpie jq zsh
test -d ~/.oh-my-zsh || sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
