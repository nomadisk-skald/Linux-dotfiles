#
# ~/.bashrc
#

#-------------------PROMTS----------------------#
# Starship
eval "$(starship init bash)"

#------------------FUNCTIONS--------------------#

# FindFile - Find and open files using fd and fzf
ff() {
  local file
  file=$(fd --type f --hidden --exclude .git | fzf --preview 'bat --style=numbers --color=always --line-range :100 {}') || return
  case "${file##*.}" in
  txt | md | c | cpp | h | py | sh | json | jsonc | lua | js | ts | html | css | xml | toml | yaml | yml | ini | conf | rs | go | java)
    "${EDITOR:-nvim}" "$file"
    ;;
  *)
    xdg-open "$file"
    ;;
  esac
}

# FindFileDir - Find and open a directory using fd and fzf
ffd() {
  local file dir
  file=$(fd --type f --hidden --exclude .git | fzf --preview 'bat --style=numbers --color=always --line-range :100 {}') || return
  dir=$(dirname "$file")
  (cd "$dir" && exec "$SHELL")
}

#----------------CUSTOM ALIASES-----------------#
alias music='cmus'
alias files='ranger'
alias calendar='calcurse'
alias sound='pavucontrol'

#-------------------OTHER-----------------------#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
