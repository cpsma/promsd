class Stack < ApplicationRecord
  has_many :scrapes, dependent: :destroy
end
