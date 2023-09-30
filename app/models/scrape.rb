class Scrape < ApplicationRecord
  belongs_to :service
  belongs_to :stack

  has_many :scrape_targets
  has_many :targets, through: :scrape_targets
end
