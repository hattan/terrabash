Describe "Infra App"
  Context "Resources - TFVars"
    setup(){
      export RG_NAME=$(get_tf_var "second_resource_group_name")
      export RG_LOCATION=$(get_tf_var "second_resource_group_location")
    }
    BeforeEach 'setup'
    It "should have a second resource group with correct name"
      When call get_resource_group_by_name "$RG_NAME"
      The output should include_name "$RG_NAME"
    End      
    It "should have a second resource group with correct name"
      When call get_resource_group_by_name "$RG_NAME"
      The output should include_location "$RG_LOCATION"
    End      
  End  
End




