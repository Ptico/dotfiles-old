#
# Aliases
#
alias ..='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias _='sudo'

alias mv='nocorrect mv -v'
alias cp='nocorrect cp -v'
alias cpf='nocorrect cp -R'
alias rm='nocorrect rm -v'
alias rmf='nocorrect rm -rfv'
alias mc='mc --nocolor'
alias mkdir='nocorrect mkdir'
alias man='nocorrect man'
alias find='noglob find'
alias ls='ls -FG'
alias ll='ls -l'
alias la='ls -a'
alias li='ls -ial'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias du='du -h'
alias df='df -h'
alias ps='ps'
alias cal='cal'
alias clr='find . -regex .*~ | xargs rm -f'
alias mkinst='sudo make install'
alias mnt='sudo mount'
alias mntl='sudo mount -o loop'
alias umnt='sudo umount'
alias h='history'
alias d='dirs -v'
alias ssync="rsync --rsh=ssh"
alias ssyncr="rsync --rsh=ssh --recursive --verbose --progress"
alias grab="sudo chown ${USER} --recursive"
alias clean="rm *~"
alias grep='grep --color=auto'

# Rails 2
alias rs='script/server'
alias rc='script/console'
alias rg='script/generate'
alias rdb='script/dbconsole'

# Rails 3
alias r='rails'

# Global
alias -g M='|more'
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'
alias -g N='2>/dev/null'

# Filetypes
alias -s conf="vim"
alias -s ini="vim"
alias -s cnf="vim"
alias -s cfg="vim"
alias -s log="tail -50"
alias -s gz="tar xzf"
alias -s bz2="tar xjf"