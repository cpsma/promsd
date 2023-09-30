class Target < ApplicationRecord
  belongs_to :job
  has_many :scrapes
end
