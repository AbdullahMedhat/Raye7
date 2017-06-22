class Trip < ApplicationRecord
  belongs_to :source, :class_name => 'Place'
  belongs_to :destination, :class_name => 'Place'
  has_many :places
  belongs_to :driver, :class_name => 'User'
end
