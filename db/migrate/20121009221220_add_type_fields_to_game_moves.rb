class AddTypeFieldsToGameMoves < ActiveRecord::Migration
  def change
    add_column :game_moves, :type_of_move, :integer
    add_column :game_moves, :type_of_ship, :integer
    add_column :game_moves, :ship_alignment, :integer
  end
end
