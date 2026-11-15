#!/bin/bash
set -e
git --version > /dev/null

# zsh theme
# https://github.com/romkatv/powerlevel10k#manual
test -d ~/powerlevel10k || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# rust toolchain - i need to make up my mind:)
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

command -v mise && mise use -g fzf jq lazygit helix zellij@0.45 zoxide
