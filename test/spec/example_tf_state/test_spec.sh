Describe "Infra App"
  Context "Resources - State File"
    setup(){
      export RG_NAME=$(get_tf_output "resource_group_name")
      export RG_LOCATION=$(get_tf_output "resource_group_location")
      export STORAGE_NAME=$(get_tf_output "storage_account_name")
    }

    BeforeEach 'setup'
    It "should have a resource group with correct name"
      When call get_resource_group_by_name "$RG_NAME"
      The output should include_name "$RG_NAME"
      The status should eq 0     
    End      

    It 'should have a resource group in correct location'
      When call get_resource_group_by_name "$RG_NAME"
      The output should include_location "$RG_LOCATION"
      The status should eq 0     
    End     

    It 'should have a resource group in correct location'
      When call get_storage_account_by_name "$STORAGE_NAME"
      The output should include_name "$STORAGE_NAME"
      The status should eq 0     
    End           
  End
End

