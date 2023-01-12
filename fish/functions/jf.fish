function jf --description 'Use fzf to quickly jump to a folder'
  set path (find . -print | fzf)

  if not test -n "$path"
    return
  end

  if test -d $path
    pushd $path
  else if test -e $path
    pushd (dirname $path)
  end
end
