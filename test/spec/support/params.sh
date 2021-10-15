Describe "Foo"
  get_output(){
    cat "$FOO"
  }
  Parameters:dynamic
     %data "$(get_output)"
  End
  foo() {
    echo $1
    #echo "hello"
  }
  It "should be ok"
    When call foo "$stateFilePath"
    The output should include "BAR"
  End
End