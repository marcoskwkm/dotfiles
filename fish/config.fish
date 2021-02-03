set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"

set -x -g TERM "xterm-256color"

set -x -g LC_ALL en_US.UTF-8
set -x -g LANG en_US.UTF-8

# Personal binaries
set PATH ~/bin $PATH

# Aliases
alias kubectl "env KUBECONFIG=(ls ~/.kube/configs/* | tr '\n' ':' | sed 's/:\$//g') kubectl"

# Go shit
set GOPATH ~/go
set PATH $PATH $GOPATH/bin

# Homebrew on M1
set PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

