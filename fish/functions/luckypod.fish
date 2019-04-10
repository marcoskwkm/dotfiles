function luckypod
  set podId (podsls | grep $argv | head -1 | awk '{print $1}')
  echo 'Using '$podId
  pod $podId
end
