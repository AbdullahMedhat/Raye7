class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :departure_time, null: false
      t.integer :seats, null: false
      t.integer :source_id, :references => "place"
      t.integer :destination_id, :references => "place"
      t.belongs_to :user
      t.timestamps
    end
  end
end
