function prod
  vtex config set env prod
  kubectl config use-context aws-1-us-east-1
end
