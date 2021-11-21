# ==========================================
# tmux
# ==========================================

if [ "$TMUX" = "" ] \
    && [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ] \
    && [ "$TERM_PROGRAM" != "vscode" ]; then
  tmux;
fi

# ==========================================
# Pure
# ==========================================

FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
autoload -U promptinit; promptinit
prompt pure

# ==========================================
# Syntax Highlighting
# ==========================================

# brew install zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# ==========================================
# Completions
# ==========================================

# brew install zsh-completions
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit; compinit

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' insert-tab false

setopt magic_equal_subst

# ==========================================
# History
# ==========================================

HISTSIZE=10000
SAVEHIST=10000

setopt share_history

setopt hist_ignore_all_dups
setopt hist_ignore_dups

setopt hist_reduce_blanks
setopt hist_no_store

setopt hist_verify
setopt hist_expand

# ==========================================
# Keybind
# ==========================================

# move word with CTRL + arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# ==========================================
# Alias
# ==========================================

alias ls="ls -G"
alias ll="ls -lF"
alias la="ls -aF"
alias lla="ls -alF"
alias lal="lla"

# ==========================================
# k8s
# ==========================================

alias k="kubectl"
source <(kubectl completion zsh)
complete -F __start_kubectl k

# ==========================================
# CircleCI
# ==========================================

alias cci="circleci"

# ==========================================
# Miscellaneous
# ==========================================

# cd - <TAB>
setopt auto_pushd

# No beep
unsetopt beep

# ==========================================
# NVM
# ==========================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ==========================================
# SDKMAN!
# ==========================================

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
