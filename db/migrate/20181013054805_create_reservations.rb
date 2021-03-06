class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :finish_date

      t.references :user, foreign_key: true
      t.references :rooms, foreign_key: true
      t.timestamps
    end
  end
end
