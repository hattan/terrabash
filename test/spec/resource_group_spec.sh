Describe "Infra App"
  Context "Resource Groups - Custom Matcher"
    It 'should have a resource group named terrabash-test'
      When call get_resource_group_by_name "terrabash-test"
      The output should include_name 'terrabash-test'
      The output should include_location 'westus'
      The output should include_json '.properties.provisioningState' 'Succeeded'
      The status should eq 0
    End     

    It 'should have a provisioningState of Succeeded'
      When call get_resource_group_by_name "terrabash-test"
      The output should include_json '.properties.provisioningState' 'Succeeded'
      The status should eq 0
    End           

    It 'should not have a resource group named foo'
      When call run_az "az group show -g foo -o json"
      The error should include "Resource group 'foo' could not be found."
      The status should eq 3
    End         
  End

  Context "Resource Groups - Bash Helpers"
    It 'should have a resource group named terrabash-test'
      When call get_resource_group_by_name "terrabash-test"
      The output should satisfy name_equals 'terrabash-test'      
      The output should satisfy location_equals 'westus' 
      The output should satisfy query_equals '.properties.provisioningState' 'Succeeded' 
      The status should eq 0
    End     
  End
End
