class Scrape < ApplicationRecord
  belongs_to :service
  belongs_to :stack

  has_many :scrape_targets, dependent: :destroy
  has_many :targets, through: :scrape_targets

  def self.register(stack_name:, service_name:, target_address:)
    stack = Stack.find_or_create_by!(name: stack_name)
    service = Service.find_by!(name: service_name)
    target = Target.find_or_create_by!(ip_address: target_address)
    scrape = Scrape.find_or_create_by!(stack: stack, service: service)
    scrape_target = ScrapeTarget.create!(scrape: scrape, target: target)
    [stack_name, service_name, target_address]
  rescue ActiveRecord::RecordNotFound
    raise ServiceNotImplementedError
  end
end
