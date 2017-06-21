class Place < ApplicationRecord
  belongs_to :customer
  has_many :trips
end
