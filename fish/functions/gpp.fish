function gpp --description 'Runs g++ with usual competitive programming arguments'
    g++ $argv.cpp -std=c++11 -Wall -O2 -g -o $argv
end
