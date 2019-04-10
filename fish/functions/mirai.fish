function mirai
  if test (count $argv) -lt 1 -o "$argv[1]" = "prod"
    curl -X GET http://mirai-zura.vtex.aws-us-east-1.vtex.io/storecomponents/marcos/mirai -H 'Authorization: '(vtex local token)
  else if test "$argv[1]" = "staging"
    curl -X GET http://mirai-zura.vtex.aws-us-east-2.vtex.io/storecomponents/marcos/mirai -H 'Authorization: '(vtex local token)
  else
    echo "Error: Unknown environment '$argv[1]'"
  end
end
