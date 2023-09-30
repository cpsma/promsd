require "test_helper"

class StackTest < ActiveSupport::TestCase
  test "removing a stack removes its scrapes" do
    stack = stacks(:db)

    assert_difference "Scrape.count", -2 do
      stack.destroy
    end
  end
end
