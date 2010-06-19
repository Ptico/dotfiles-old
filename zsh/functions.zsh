# Detect if MC running
ifmc () {
  if [ $MC_SID ]; then
  	echo "|mc|"
  else
  	echo ''
  fi
}

# Git branch
parse_git_dirty() {
  git diff --quiet || echo "*"
}

git_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}$(parse_git_dirty)"
}

# Load functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)