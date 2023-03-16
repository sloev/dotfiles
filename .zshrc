# exports
export TERM="xterm-256color"
export PATH="/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# sourcings
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

autoload colors && colors


#plugins
zplug "plugins/git",   from:oh-my-zsh
zplug "lib/history",   from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# prompt 
setopt prompt_subst
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}] %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""



my_git_prompt() {
    if [[ -d $(git rev-parse --show-toplevel 2>/dev/null) ]]; then
        echo $(git_prompt_info)
    else
        echo ''
    fi
}

local PGIT='$(my_git_prompt)'


PROMPT="${PGIT}%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%} > "

export PS1=$PROMPT
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# functions

function delpyc() {
  echo "recursively removing .pyc files from this directory"
  pwd
  find . -name "*.pyc" -exec rm '{}' ';'
}

# alias
#
alias colorize="ccze -A | less +G -R"
alias ls='ls -GFh'
alias fix_zplug="echo 'fixing zplug' && rm ~/.zplug/zcompdump && exec zsh"
# init zplug
zplug load


export PATH="/Users/me/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias journal="python ~/Documents/journal/journal.py"
