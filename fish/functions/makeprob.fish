function makeprob
  if test (count $argv) -lt 2
    echo "Usage: makeprob [folder-name] [file-name-without-extension]"
  else
    mkdir $argv[1]
    cp ~/code/templates/Makefile $argv[1]
    cp ~/code/templates/template.cpp $argv[1]/$argv[2].cpp
  end
end
