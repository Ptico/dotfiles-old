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

# Colors definition http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/
typeset -Ag FX FG BG

FX=(
    reset     "[00m"
    bold      "[01m" no-bold      "[22m"
    italic    "[03m" no-italic    "[23m"
    underline "[04m" no-underline "[24m"
    blink     "[05m" no-blink     "[25m"
    reverse   "[07m" no-reverse   "[27m"
)
for color in {000..255}; do
    FG[$color]="[38;5;${color}m"
    BG[$color]="[48;5;${color}m"
done

#source ~/.zsh/lscolors.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/keybind.zsh
source ~/.zsh/aliases.zsh

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