get_tf_output() {
  local name=$1
  local value=$(cat "$stateFilePath" | jq -r ".outputs.$name.value")
  echo "$value"
}

get_tf_var(){
  local name=$1
  local value=$(json2hcl -reverse < $tfVarsPath| jq -r ".$name")
  echo "$value"
}
