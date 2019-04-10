function staging
  vtex config set env staging
  kubectl config use-context aws-2-us-east-1
end
