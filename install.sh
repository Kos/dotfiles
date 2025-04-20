#!/bin/bash
# Deps
which brew && brew     install fzf wget jq lazygit
which apt  && sudo apt install fzf wget curl jq zsh

# Shell: OMZ, p10k
test -d ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
test -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"