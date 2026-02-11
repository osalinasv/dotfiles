alias zsh-reload="source ~/.zshrc"
alias zsh-edit="nvim ~/.zshrc"

# basic setup
HISTFILE=$HOME/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase

export EDITOR='nvim'
export MANPAGER='nvim +Man!'

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd
setopt extendedglob
setopt nomatch
setopt menucomplete
setopt interactive_comments

unsetopt BEEP

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# keybinds
bindkey '^[[3~' delete-char

# completion using arrow keys (based on history partial search)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Word navigation (Control+Arrow)
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Line start/end (Control+Up/Down)
bindkey '^[[1;5A' beginning-of-line
bindkey '^[[1;5B' end-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# ---- Node ----
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---- Bun ----
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
# [ -s "/Users/osalinasv/.bun/_bun" ] && source "/Users/osalinasv/.bun/_bun"

# ---- Cargo ----
. "$HOME/.cargo/env"

# Added by zap installation script
PATH=$PATH:$HOME/.local/bin/

# ---- Aliases ----

alias g="git"
alias gg="lazygit"
alias v="nvim"
alias vim="nvim"
alias d="docker"
alias dd="lazydocker"
alias dc="docker-compose"
alias k="kubectl"
alias kk="k9s"
alias dn="dotnet"

# ---- FZF ----
eval "$(fzf --zsh)"

# use fd instead of fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# ---- Bat (better cat) ----
export BAT_STYLE="plain,numbers"
alias cat="bat"

# ---- Eza (better ls) -----
alias ls="eza --icons=always"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

# ---- Zinit ----
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
# zinit snippet OMZP::command-not-found

zinit ice wait atload '_history_substring_search_config'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

autoload -Uz compinit
compinit

# ---- Starship ----
eval "$(starship init zsh)"
