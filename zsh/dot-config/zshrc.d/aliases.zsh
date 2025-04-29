# Aliases
alias ll="ls -l"
alias la="ls -a"
alias lt="ls -T"
alias lla="ls -l -a"

# Application aliases
alias n="nvim"
alias rm='echo "This is not the command you want to use"; return false; '
alias ls="eza --color=always --icons=always"


# Since trash is installed 
if [[ $(which eza) ]] ; then 
  # echo 'EZA found'
else 
   alias "ls ..color=always" 
fi

