require "test_helper"

class StacksControllerTest < ActionDispatch::IntegrationTest
  test "can delete a stack" do
    stack = stacks(:db)

    assert_difference "Stack.count", -1 do
      delete stack_path(stack.name)
    end
  end
end
