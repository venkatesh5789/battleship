class RemoveTypeOfShipFromGameMoves < ActiveRecord::Migration
  def change
    remove_column :game_move_notifications, :type_of_ship
  end
end
