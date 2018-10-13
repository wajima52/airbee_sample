class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :home_type
      t.integer :room_type
      t.integer :accommodate
      t.integer :bedroom_number
      t.integer :bathroom_number
      t.integer :price
      t.string :title
      t.text :description
      t.string :location
      t.string :location
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
