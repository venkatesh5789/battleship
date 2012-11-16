class AddTypeFieldsToGameMoves < ActiveRecord::Migration
  def change
    add_column :game_moves_notifications, :type_of_ship, :integer
    add_column :game_moves_notifications, :type_of_move, :integer
    add_column :game_moves_notifications, :ship_alignment, :integer
  end
end
