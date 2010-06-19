umask 022

# Some defaults
export EDITOR=vi
export PAGER=less
export LANG="ru_RU.UTF-8"

# Options
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt AUTO_CD
setopt NO_BEEP
setopt NO_BG_NICE

SAVEHIST=5000
HISTFILE=~/.zsh_history

export UNAME_S=$(uname -s 2>&1 || echo "Linux" )

source ~/.zsh/lscolors.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/keybind.zsh
source ~/.zsh/aliases.zsh

if [[ $UNAME_S == "Darwin" ]]; then
  # Reread path and make GNU coreutils happy
  export PATH=''
  PATH=`read_path_dir /etc/paths "$PATH"`
  PATH=`read_path_dir /etc/path.d "$PATH"`
  export PATH
fi

PROMPT_THEME='swamp'

if [[ -f ~/.myconfig ]]; then
  source ~/.myconfig
fi

if [[ $UNAME_S == "Darwin" && $TERM_PROGRAM == "Apple_Terminal" ]]; then
  source ~/.zsh/prompts/term
else
  source ~/.zsh/prompts/$PROMPT_THEME
fi

setprompt

# RVM
# bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm