class User < ApplicationRecord
  belongs_to :group
  has_one :place
  has_one :work_place, :foreign_key => "work_place_id", :class_name => "Place"
  has_many :trips
end
