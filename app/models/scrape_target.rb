class ScrapeTarget < ApplicationRecord
  belongs_to :target
  belongs_to :scrape
end
