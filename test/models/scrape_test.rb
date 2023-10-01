require "test_helper"

class ScrapeTest < ActiveSupport::TestCase
  setup do
    @stack = stacks(:db)
    @service = services(:mysql)
    @target = "192.168.1.20"
  end

  test "registering a scrape with a stack that already exists does not create a new stack" do
    assert_no_difference "Stack.count" do
      Scrape.register(stack: @stack.name, service: @service.name, target: @target)
    end
  end 

  test "registering a scrape with a stack that does not exist creates a new stack" do
    assert_difference "Stack.count" do
      Scrape.register(stack: "ci", service: @service.name, target: "192.168.1.30")
    end 
  end

  test "registering a scrape for a service and a stack that already exists does not create a new scrape" do
    assert_no_difference "Scrape.count" do
      Scrape.register(stack: @stack.name, service: @service.name, target: @target)
    end
  end

  test "registering a scrape for a service and a stack that does not exist creates a new scrape" do
    assert_difference "Scrape.count" do
      Scrape.register(stack: "dns", service: @service.name, target: @target)
    end
  end

  test "registering a target scrape with a target that already exists does not create a new target" do
    target = targets(:db1)

    assert_no_difference "Target.count" do
      Scrape.register(stack: "db-cluster", service: @service.name, target: target.ip_address) 
    end
  end

  test "registering a target scrape with a new target creates a new target" do
    assert_difference "Target.count" do
      Scrape.register(stack: @stack.name, service: @service.name, target: @target) 
    end
  end

  test "registering a scrape creates a new scrape target" do
    assert_difference "ScrapeTarget.count" do
      Scrape.register(stack: @stack.name, service: @service.name, target: @target)  
    end
  end
end
