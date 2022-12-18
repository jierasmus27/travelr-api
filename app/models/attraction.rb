class Attraction < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end