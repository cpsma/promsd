json.array! @jobs do |job|
  json.targets job.targets.map { |t| "#{t.ip_address}:#{job.port}" }
  json.set! :labels, {
    "__meta_prometheus_job": job.name
  }
end
