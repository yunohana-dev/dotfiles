# appends .bashrc below
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

alias pbcopy='xsel --clipboard --input'

peco-repos () {
  cd "$(ghq list --full-path | peco)"
}
alias repos='peco-repos'

