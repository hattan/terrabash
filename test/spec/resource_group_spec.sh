Describe "Infra App"
  Context "Resource Groups - Custom Matcher"
    It 'should have a resource group named terrabash-test'
      When call run_az "az group show -n terrabash-test -o json"
      The output should include_name 'terrabash-test'
      The output should include_location 'westus'
      The output should include_json '.properties.provisioningState' 'Succeeded'
      The status should eq 0     
    End         
  End
End

