require "test_helper"

class StacksControllerTest < ActionDispatch::IntegrationTest
  test "can delete a stack" do
    stack = stacks(:db)

    assert_difference "Stack.count", -1 do
      delete stack_path(stack.name)
    end
  end

  test "returns a message on successful deletion of stack" do
    stack = stacks(:db)

    delete stack_path(stack.name)

    assert_equal "The stack 'db' and its scrapes have been deleted",
      JSON.parse(response.body)["message"]
  end
end
