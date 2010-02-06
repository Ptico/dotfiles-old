#
# Aliases
#
alias ..='cd ..'

alias mv='nocorrect mv -v'
alias cp='nocorrect cp -v'
alias rm='nocorrect rm -v'
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
alias cfg='./configure --prefix=/usr --sysconfdir=/etc'
alias h=history
alias ispell='ispell -d russian'
alias d='dirs -v'
alias ssync="rsync --rsh=ssh"
alias ssyncr="rsync --rsh=ssh --recursive --verbose --progress"
alias grab="sudo chown ${USER} --recursive"
alias hmakej="hilite make -j"
alias clean="rm *~"
alias grep='grep --color=auto'

alias -g M='|more'
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'
alias -g N='2>/dev/null'

alias -s log="tail -50"