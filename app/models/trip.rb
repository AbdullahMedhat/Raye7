class Trip < ApplicationRecord
  belongs_to :source, :class_name => 'Place', :foreign_key => 'source_id'
  belongs_to :destination, :class_name => 'Place', :foreign_key => 'destination_id'
  belongs_to :user
end
