function gpp --description 'Runs g++ with usual competitive programming arguments'
    g++-9 $argv.cpp -std=c++11 -Wall -O2 -g -o $argv
end
