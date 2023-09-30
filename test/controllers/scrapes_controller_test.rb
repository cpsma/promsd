require "test_helper"

class ScrapesControllerTest < ActionDispatch::IntegrationTest
  test "returns a list of scrapes" do
    get "/"

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
end
