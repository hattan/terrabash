# shellcheck shell=sh

# This callback function will be invoked after core modules has been loaded.
spec_helper_configure() {
  # Available functions: import, before_each, after_each, before_all, after_all
  import 'support/custom_matcher'
}

# Resource Helper Functions
get_resource_group_by_name() {
  resourceGroupName=$1
  run_az "az group show -g $resourceGroupName -o json"
}

# AZ CLI functions
run_az() {
  command=$1
  json=$(exec $command)        
  local code=$?
  if [[ ! -z "$json" ]]; then
    echo "$json"
  fi
  return $code
}