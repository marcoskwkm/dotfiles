# Use x86 Homebrew in x86 arch
function brew
  if [ "$(arch)" = "arm64" ];
    /opt/homebrew/bin/brew $argv
  else
    /usr/local/bin/brew $argv
  end
end