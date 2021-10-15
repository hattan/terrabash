get_tf_output() {
  local name=$1

  if [[ -z "$TB_STATE_FILE_PATH" ]]; then
    error "Can't read output values, state file path is missing. Please set the variable TB_STATE_FILE_PATH" 
    exit 1
  fi

  local outputExists=$(cat "$TB_STATE_FILE_PATH" | jq --arg name "$name" '.outputs | has($name)')
  if [[ "$outputExists" == "false" ]]; then
   error "$name not found in Terraform output. TF State file: $TB_STATE_FILE_PATH" 
   exit 1
  fi

  local value=$(cat "$TB_STATE_FILE_PATH" | jq -r ".outputs.$name.value")
  echo "$value"
}

get_tf_var(){
  local name=$1
  local value=$(json2hcl -reverse < $tfVarsPath| jq -r ".$name")
  echo "$value"
}
