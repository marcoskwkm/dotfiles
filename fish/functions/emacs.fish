function emacs
  if pgrep -f Emacs > /dev/null
    emacsclient $argv &>/dev/null &; disown
  else
    command emacs &>/dev/null $argv &; disown
    sleep 0.5; open /Applications/Emacs.app
  end
end

alias emasc emacs
alias emcas emacs