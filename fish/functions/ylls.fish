function ylls
  find node_modules node_modules/\@* -depth 1 -type l -print | while read MODULE
    echo "Linked module in use: $MODULE"
  end
end