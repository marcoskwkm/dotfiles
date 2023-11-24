function emacs
  if not pgrep -f Emacs > /dev/null
    command emacs $argv > /dev/null 2> /dev/null &; disown
  else
    command emacsclient $argv &; disown
  end

  open /Applications/Emacs.app
end

alias emasc emacs
alias emcas emacs