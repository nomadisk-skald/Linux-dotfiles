#
# ~/.bashrc
#

eval "$(starship init bash)"

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

ffd() {
  local file dir
  file=$(fd --type f --hidden --exclude .git | fzf --preview 'bat --style=numbers --color=always --line-range :100 {}') || return
  dir=$(dirname "$file")
  (cd "$dir" && exec "$SHELL")
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
