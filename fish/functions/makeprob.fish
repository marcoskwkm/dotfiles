function makeprob
  if test (count $argv) -lt 2
    echo "Usage: makeprob [folder-name] [file-name-without-extension]"
  else
    mkdir $argv[1]
    cp ~/repos/code/templates/Makefile $argv[1]
    cp ~/repos/code/templates/template.cpp $argv[1]/$argv[2].cpp
    cp ~/repos/code/templates/compile_flags.txt $argv[1]
    ln -s ~/repos/code/templates/stdcpp.h $argv[1]/
  end
end
