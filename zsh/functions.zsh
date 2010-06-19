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

function read_path_dir () {
	DIR="$1"
	NEWPATH="$2"
	EXT="$3"
	SEP=""
	IFS=$'\n'
	if [ -d "$DIR".d ]; then
		for f in "$DIR" "$DIR".d/*"$EXT" ; do
		  if [ -f "$f" ]; then
			for p in $(< "$f") ; do
				[[ "$NEWPATH" = *(*:)${p}*(:*) ]] && continue
				[ ! -z "$NEWPATH" ] && SEP=":"
				NEWPATH="${p}${SEP}${NEWPATH}"
			done
		  fi
		done
	fi
	echo $NEWPATH
}

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

# Load functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)