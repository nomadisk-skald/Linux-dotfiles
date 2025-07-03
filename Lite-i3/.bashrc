#
# ~/.bashrc
#
eval "$(starship init bash)"
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ff='xdg-open "$(fzf)"'

f() {
  local file
  file=$(fd --type f --hidden --exclude .git | fzf --preview 'bat --style=numbers --color=always --line-range :100 {}') || return
  case "${file##*.}" in
  txt | md | c | cpp | h | py | sh | json | lua)
    ${EDITOR:-nvim} "$file"
    ;;
  *)
    xdg-open "$file"
    ;;
  esac
}

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
