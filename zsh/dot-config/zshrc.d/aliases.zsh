# Application aliases
alias n="nvim"

# Since trash is installed 
alias rm='echo "This is not the command you want to use"; return false; '

# Since EZA is installed 
if [[ $(which eza) ]] ; then 
  # echo 'EZA found'
  alias ls="eza --color=always --icons=always"
else 
   alias "ls --color=always" 
fi

# Other aliases
alias grep='grep --color=auto'
alias ll="ls -l"
alias la="ls -a"
alias lt="ls -T"
alias lla="ls -l -a"


