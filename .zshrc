# exports
export TERM="xterm-256color"
export PATH="/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


# sourcings
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source ~/.zplug/init.zsh
source /usr/local/bin/virtualenvwrapper.sh
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

# Determine active Python virtualenv details.
function get_virtualenv () {
  if [[ `pyenv version-name` == "system" ]] ; then
      echo "%{$fg[white]%}(${$(python -V 2>&1):7})%{$reset_color%}"
  else
      echo "%{$fg[magenta]%}($(pyenv version-name))%{$reset_color%}"
  fi
}

my_git_prompt() {
    if [[ -d $(git rev-parse --show-toplevel 2>/dev/null) ]]; then
        echo $(git_prompt_info)
    else
        echo ''
    fi
}

local PGIT='$(my_git_prompt)'
local PENV='$(get_virtualenv)'

PROMPT="${PENV} ${PGIT}%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%} > "

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
