require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "returns a list of jobs" do
    get "/"

    assert_equal [
      {
        "targets" => ["192.168.1.1:9100", "192.168.1.2:9100"],
        "labels" => {
          "__meta_prometheus_job" => "node-exporter"
        }
      },
      {
        "targets" => ["192.168.1.2:9090"],
        "labels" => {
          "__meta_prometheus_job" => "prometheus"
        }
      }
    ], JSON.parse(response.body)
  end 
end
