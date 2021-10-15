Describe "Infra App"
  Context "Resources - Exported Static Names"
    It "should have a second resource group with correct name"
      When call get_resource_group_by_name "$staticRGName"
      The output should include_name "$staticRGName"
    End      
  End  
End




