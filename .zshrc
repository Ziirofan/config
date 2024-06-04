# Add Homebrew to the PATH.
eval "$(/usr/local/bin/brew shellenv)"

# Add brew's version of curl to the PATH
export PATH="$(brew --prefix curl)/bin:$PATH"

# Init starship for customize ui 
eval "$(starship init zsh)"

# Aliases to make life easier.
alias cd='z'
alias ...='cd ../../'
alias ....='cd ../../../'
alias -g ...='../../'
alias dc='docker-compose'
alias gb='git branch'
alias gbd='git branch -d'
alias gbm='git branch --merge'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gp='git push'
alias gpl='git pull'
alias gpls='git pull && git submodule update --init --recursive'
alias gpf='git push --force'
alias garbc="git add . && git rebase --continue"
alias grep='grep --color=auto'
alias github='gh dash'
alias h='history 1'
alias hs='history 1| grep'
alias hsi='history 1| grep -i'
alias ip='ifconfig | egrep -o "inet ([0-9]{1,3}(\.)?){0,4}" | tr -d "\040\011inet"'
alias l='lsd -lAh'
alias sizes='du -hd1|gsort -hr'
alias vim="nvim"
alias vi="nvim ."
alias oldvim="vim"
alias ls="lsd"
alias cdh="cd ~"
alias cdr="cd ~/Repository"
alias lgit="lazygit"
alias mprocsD="mprocs -c $HOME/.config/mprocs/mprocslocal.yaml"
alias mprocsL="mprocs -c .mprocs.yaml"
alias fzfp="fzf --preview 'bat --style=numbers --color=always {}'"
alias fzfh="history | fzf"
alias tmuxd="tmux new-session -A -s default"
alias cat="bat"

# Search current directory, home directory, and www projects folder
# See: http://weblog.bocoup.com/shell-hacking-cdpath/
cdpath=(. $HOME/www/)

# Set up Zsh options. There are many of these that can be tweaked!
# See: https://zsh.sourceforge.io/Doc/Release/Options.html
setopt alwaystoend
setopt appendhistory
setopt autocd
setopt autolist
setopt automenu
setopt autopushd
setopt completeinword
setopt correct
setopt extendedhistory
setopt histexpiredupsfirst
setopt histignoredups
setopt histignorespace
setopt histverify
setopt interactivecomments
setopt listpacked
setopt longlistjobs
setopt nocaseglob
setopt noflowcontrol
setopt promptsubst
setopt pushdignoredups
setopt pushdminus
setopt sharehistory

# Tweak some history options.
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh/.zsh_history

# Set up zsh up/down/home/end key search completions.
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey -e
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '[C' forward-word
bindkey '[D' backward-word

# A handy git diff that ignores JS and CSS sourcemaps and compiled files.
function gdiff () {
    git diff $1 ':!*.map' ':!*.css' ':!*.min.*'
}

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='vim'
 fi

# export secret environment variables
export $(cat ~/.secret | xargs -L 1)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

# Set up color for tools that use termcap, like less and man.
export LESS_TERMCAP_mb=$(print -P "%F{cyan}") \
    LESS_TERMCAP_md=$(print -P "%B%F{cyan}") \
    LESS_TERMCAP_me=$(print -P "%f%b") \
    LESS_TERMCAP_so=$(print -P "%K{magenta}") \
    LESS_TERMCAP_se=$(print -P "%K{black}") \
    LESS_TERMCAP_us=$(print -P "%U%F{yellow}") \
    LESS_TERMCAP_ue=$(print -P "%f%u")

# Add files and directories color when running ls
# There's a generator here: http://geoff.greer.fm/lscolors/
export CLICOLOR=1
export LS_COLORS='di=36:ln=1;35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export GREP_COLOR='1;35;40'

# Run zsh-syntax-highlighting (installed via homebrew).
# See: https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Trick out the zsh completion engine.
# See: https://www.csse.uwa.edu.au/programming/linux/zsh-doc/zsh_23.html
# The following lines were added by compinstall
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' prompt 'Did you mean?'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
autoload -Uz compinit
compinit

# See: https://iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Just adding a fun image for when the shell first opens. Why? Because I can.
# Require imgcat: https://github.com/eddieantonio/imgcat
# imgcat ~/Pictures/bubble-bobble.png

eval "$(mcfly init zsh)"
source "$(redo alias-file)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
#export lDOCKER_HOST=unix:///$HOME/.colima/docker.sock
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if [ -f "${PWD}/.nvmrc" ]; then
  eval "$(nvm use --silent)"
fi
