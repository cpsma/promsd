class Scrape < ApplicationRecord
  belongs_to :service
  belongs_to :stack

  has_many :scrape_targets, dependent: :destroy
  has_many :targets, through: :scrape_targets

  def self.register(stack:, service:, target:)
    stack = Stack.find_or_create_by!(name: stack)
    service = Service.find_by!(name: service)
    target = Target.find_or_create_by!(ip_address: target)
    scrape = Scrape.find_or_create_by!(stack: stack, service: service)
    scrape_target = ScrapeTarget.create!(scrape: scrape, target: target)
    [stack, service, target]
  rescue ActiveRecord::RecordNotFound
    raise ServiceNotImplementedError
  end
end
