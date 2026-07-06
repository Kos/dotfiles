if command -v zellij >/dev/null && [[ -z "$ZELLIJ" && -z "$TERM_PROGRAM" ]]; then
  zellij attach -c
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# zmodload zsh/zprof


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$PATH


# Reasonable ctrl+w, see https://github.com/ohmyzsh/ohmyzsh/issues/8743
WORDCHARS=''

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# Shell options
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt multios
setopt long_list_jobs
setopt interactivecomments
setopt no_beep

source ~/.zsh/completion
source ~/.zsh/aliases

# Key bindings
bindkey -e
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

if [[ -n "${terminfo[khome]}" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line
fi
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey "${terminfo[kend]}" end-of-line
fi
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char
fi

# URL paste safety
if [[ -e "${fpath[(r)*/url-quote-magic]}" ]]; then
  autoload -Uz bracketed-paste-magic url-quote-magic
  zle -N bracketed-paste bracketed-paste-magic
  zle -N self-insert url-quote-magic
fi

# Editor
if command -v hx >/dev/null; then
  export EDITOR="hx"
  alias vim=hx
elif command -v vim >/dev/null; then
  export EDITOR="vim"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

setopt transient_rprompt
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Tools
# -----

# Node
command -v fnm > /dev/null && eval "$(fnm env)"

# Work
[ -f ~/.zsh/ro ] && source ~/.zsh/ro
[ -f ~/.zsh/ro-extras ] && source ~/.zsh/ro-extras

# FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# Atuin
command -v atuin > /dev/null && eval "$(atuin init zsh --disable-up-arrow)"

# Some new additions
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

# Personal
# source ~/.zsh/zellij-completion

# less
export LESS='-R --mouse'
export LESSOPEN="|/opt/homebrew/bin/lesspipe.sh %s"

# jujutsu
# command -v jj > /dev/null && source <(jj util completion zsh)

# Debugger?
# export PYTHONBREAKPOINT="pdbr.set_trace"

#bindkey "^[C" forward-word
#bindkey "^[D" backward-word
bindkey "\e[1;3C" forward-word
bindkey "\e[1;3D" backward-word
# completions!
# get-completion-command() {
#   local cmd="$BUFFER"

#   case "$cmd" in
#     yarn\ e2e\ *)
#       rg --files -g "*.spec.ts"
#       ;;
#     doer\ *)
#       echo "doer -list"
#       ;;
#     go\ test\ *)
#       echo "git ls-files | grep _test.go"
#       ;;
#     yarn\ test\ *)
#       echo "git ls-files | grep .test.ts"
#       ;;
#     *)
#       rg --files
#       ;;
#   esac
# }

# custom widget
# fzf-smart-complete() {
#   # Grab left word (before the cursor)
#   local left="${BUFFER:0:$CURSOR}"
#   local word=${left##* }
  
#   # run your fuzzy generator with $word as hint/query
#   local selection
#   selection=$(get-completion-command "$left" | fzf --query="$word") || return

#   # replace that word with selected item
#   BUFFER="${left%${word}}${selection}${BUFFER:$CURSOR}"
#   CURSOR=$(( ${#left%${word}} + ${#selection} ))
#   zle redisplay
# }

# bind it to Ctrl-T
# zle -N fzf-smart-complete
# bindkey '^T' fzf-smart-complete

# zoxide!
eval "$(zoxide init zsh)"

# Shell profiling
# zprof
