#!/bin/bash
which brew && brew     install fzf wget jq lazygit
which apt  && sudo apt install fzf wget curl jq zsh
test -d ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
