Describe "Infra App"
  Context "Resource Groups"
    It 'should have a resource group named terrabash-test'
      When call get_resource_group_by_name "terrabash-test"
      The output should include_name 'terrabash-test'
      The output should include_location 'westus'
      The output should include_json '.properties.provisioningState' 'Succeeded'
      The status should eq 0
    End      

    It 'should not have a resource group named foo'
      When call run_az "az group show -g foo -o json"
      The error should equal "ERROR: Resource group 'foo' could not be found."
      The status should eq 3
    End         
  End
End
