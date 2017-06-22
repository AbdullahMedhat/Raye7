class User < ApplicationRecord
  belongs_to :group
  belongs_to :trip, optional: true
  belongs_to :home_place, :class_name => 'Place'
  belongs_to :work_place, :class_name => 'Place'
  has_many :places
  has_many :trips, through: :guests
  has_one :guest
end
