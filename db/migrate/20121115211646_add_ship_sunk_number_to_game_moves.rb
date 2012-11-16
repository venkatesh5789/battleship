class AddShipSunkNumberToGameMoves < ActiveRecord::Migration
  def change
    add_column :game_moves_notifications, :ship_sunk_number, :integer
  end
end
