export PATH=$(brew --prefix)/bin:$PATH
  
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
    
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWSTASHSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES='verbose'
  export GIT_PS1_DESCRIBE_STYLE='branch'
  export GIT_PS1_SHOWUPSTREAM='verbose'
    
  PS1='\n\[\e[32m\]\u\[\e[0m\]@\[\e[34m\]\H\[\e[0m\] at \[\e[35m\]\w\[\e[0m\]'
  if type -t __git_ps1 | grep -q '^function$' 2>/dev/null; then
        PS1=$PS1'$(__git_ps1)'
      fi
      export PS1=$PS1'\n[\[\e[36m\]\D{%Y-%m-%d %T}\[\e[0m\]]\$ '
        
      alias ls='ls -G'
      alias ll='ls -la'
      alias reload='source ~/.bash_profile'
        
      if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
        
      complete -cf sudo

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
