#!/bin/bash
which brew && brew     install fzf wget jq lazygit
which apt  && sudo apt install fzf wget curl jq zsh

# p10k
test -d ~/powerlevel10k || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
test -d ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
