# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# Instant shell currently off because we're FAST.

# Profiler part 1 (enable here + at the end):
# zmodload zsh/zprof

# Includes
source ~/.zsh/aliases
source ~/.zsh/behaviour
source ~/.zsh/completion

export PATH=$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$PATH

# P10K theme + settings
setopt transient_rprompt
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh

# Editor
if command -v hx >/dev/null; then
  export EDITOR="hx"
elif command -v vim >/dev/null; then
  export EDITOR="vim"
fi

# Node
command -v fnm > /dev/null && eval "$(fnm env)"

# FZF
source <(fzf --zsh)

# Atuin
command -v atuin > /dev/null && eval "$(atuin init zsh --disable-up-arrow)"

# zoxide ('z' alias for cd'ing around)
eval "$(zoxide init zsh)"

# Work-specific includes
[ -f ~/.zsh/ro ] && source ~/.zsh/ro
[ -f ~/.zsh/ro-extras ] && source ~/.zsh/ro-extras

# Some new additions to eventually figure out
# function livegrep(){
#   rg --line-number --no-heading --color=always --smart-case $1 |
#     fzf -d ':' -n 1,3.. --ansi --no-sort --preview 'bat --color=always --highlight-line {2} {1}' --preview-window 'right:50%:+{2}+3/3,~3' \
#     --bind 'f1:become(hx {1}:{2})' \
#     --bind 'f2:become(nvim +{2} {1})' \
#     --bind 'f3:execute(gvim +{2} {1} &)' \
#     --bind 'f5:execute(git lg --color=always {1} | less -r)' \
#     --bind 'f6:execute(git diff --color=always {1} | less -r)'
# }

# function livefind(){
#   fd $1 | fzf --ansi --preview 'bat --color=always {1}' \
#   --bind 'f1:become(hx {1})' \
#   --bind 'f2:become(nvim {1})' \
#   --bind 'f3:execute(gvim {1} &)' \
#   --bind 'f5:execute(git lg --color=always {1} | less -r)' \
#   --bind 'f6:execute(git diff --color=always {1} | less -r)'
# }

# Shell profiler part 2:
# zprof
