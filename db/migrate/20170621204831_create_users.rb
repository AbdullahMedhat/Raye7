class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.belongs_to :group
      t.integer :place_id
      t.integer :work_place_id
      t.timestamps
    end
  end
end
