function rep
  if count $argv > /dev/null
    cd ~/vtex/$argv
  else
    cd ~/vtex
  end
end
