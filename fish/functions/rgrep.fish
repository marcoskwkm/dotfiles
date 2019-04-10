function rgrep
  grep -R $argv . --exclude-dir=node_modules
end
