class RemoveTypeOfShipFromGameMoves < ActiveRecord::Migration
  def change
    remove_column :game_moves, :type_of_ship
  end
end
