function ef
  set path (fzf)
  if test -n "$path"
    emacs $path
  end
end
