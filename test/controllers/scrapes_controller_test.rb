require "test_helper"

class ScrapesControllerTest < ActionDispatch::IntegrationTest
  test "returns a list of scrapes" do
    get scrapes_path

    assert_equal [
      {
        "targets" => ["192.168.1.1:3306"],
        "labels" => {
          "__meta_infra_stack" => "db",
          "__meta_infra_service" => "mysql"
        }
      },
      {
        "targets" => ["192.168.1.1:9100", "192.168.1.2:9100"],
        "labels" => {
          "__meta_infra_stack" => "db",
          "__meta_infra_service" => "node-exporter"
        }
      },
      {
        "targets" => ["192.168.1.10:9100"],
        "labels" => {
          "__meta_infra_stack" => "monitoring",
          "__meta_infra_service" => "node-exporter"
        }
      },
      {
        "targets" => ["192.168.1.10:9090"],
        "labels" => {
          "__meta_infra_stack" => "monitoring",
          "__meta_infra_service" => "prometheus"
        }
      }
    ], JSON.parse(response.body)
  end

  test "can register a scrape" do
    post scrapes_path, params: { stack: "db", service: "mysql", target: "192.168.1.3" }

    assert_equal "Scrape registered for 192.168.1.3 (db/mysql)",
      JSON.parse(response.body)["message"]
  end

  test "returns a message if the scrape has already been registered" do
    stack = stacks(:db)
    service = services(:mysql)
    target = targets(:db1)
    
    post scrapes_path, params: { stack: stack.name, service: service.name, target: target.ip_address }

    assert_equal "Scrape already registered for #{target.ip_address} (#{stack.name}/#{service.name})",
      JSON.parse(response.body)["message"]
  end

  test "returns a message if the service for the scrape does not exist" do
    stack = stacks(:db)
    target = targets(:db1)
    
    post scrapes_path, params: { stack: stack.name, service: "nonexistent", target: target.ip_address }

    assert_equal "The service 'nonexistent' has not been implemented",
      JSON.parse(response.body)["message"] 
  end
end
