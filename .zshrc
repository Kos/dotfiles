# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# zmodload zsh/zprof

setopt transient_rprompt

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Editor
if command -v hx >/dev/null 2>&1; then
  export EDITOR="hx"
  alias vim=hx
elif command -v vim >/dev/null 2>&1; then
  export EDITOR="vim"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git extract fzf)
plugins=(git extract)

DISABLE_AUTO_UPDATE=true
source $ZSH/oh-my-zsh.sh

# User configuration

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Tools
# -----

# Node
command -v fnm > /dev/null && eval "$(fnm env)"

# Work
[ -f ~/.zsh/ro ] && source ~/.zsh/ro
[ -f ~/.zsh/ro-extras ] && source ~/.zsh/ro-extras

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Atuin
eval "$(atuin init zsh --disable-up-arrow)"

# Some new additions
function livegrep(){
  rg --line-number --no-heading --color=always --smart-case $1 |
    fzf -d ':' -n 1,3.. --ansi --no-sort --preview 'bat --color=always --highlight-line {2} {1}' --preview-window 'right:50%:+{2}+3/3,~3' \
    --bind 'f1:become(hx {1}:{2})' \
    --bind 'f2:become(nvim +{2} {1})' \
    --bind 'f3:execute(gvim +{2} {1} &)' \
    --bind 'f5:execute(git lg --color=always {1} | less -r)' \
    --bind 'f6:execute(git diff --color=always {1} | less -r)'
}

function livefind(){
  fd $1 | fzf --ansi --preview 'bat --color=always {1}' \
  --bind 'f1:become(hx {1})' \
  --bind 'f2:become(nvim {1})' \
  --bind 'f3:execute(gvim {1} &)' \
  --bind 'f5:execute(git lg --color=always {1} | less -r)' \
  --bind 'f6:execute(git diff --color=always {1} | less -r)'
}

# Personal
source ~/.zsh/aliases

# lesspipe
export LESSOPEN="|/opt/homebrew/bin/lesspipe.sh %s"

# jujutsu
source <(jj util completion zsh)

# Debugger?
# export PYTHONBREAKPOINT="pdbr.set_trace"

# Shell profiling
# zprof
