function chacc
  sed -i '' "s/\"account\": \".*\"/\"account\": \"$argv\"/" ~/.config/configstore/vtex.json
end
