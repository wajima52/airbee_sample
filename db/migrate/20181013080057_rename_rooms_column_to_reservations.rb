class RenameRoomsColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :rooms_id, :room_id
  end
end
