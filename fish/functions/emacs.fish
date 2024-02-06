function emacs
  if pgrep -f Emacs > /dev/null
    emacsclient --eval '(tab-bar-new-tab)'
    emacsclient $argv &>/dev/null &; disown
  else
    open -a /Applications/Emacs.app $argv
  end  
end

alias emasc emacs
alias emcas emacs