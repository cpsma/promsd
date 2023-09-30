json.array! @scrapes do |scrape|
  json.targets scrape.targets.order(:ip_address).map { |target| "#{target.ip_address}:#{scrape.service.port}" } 
  json.set! :labels, {
    "__meta_infra_stack": scrape.stack.name,
    "__meta_infra_service": scrape.service.name,
  }
end
