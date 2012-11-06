class AddIsShipSunkStatusToGamePlayers < ActiveRecord::Migration
  def change
    add_column :game_players, :is_ship1_sunk, :boolean
    add_column :game_players, :is_ship2_sunk, :boolean
    add_column :game_players, :is_ship3_sunk, :boolean
    add_column :game_players, :is_ship4_sunk, :boolean
    add_column :game_players, :is_ship5_sunk, :boolean
  end
end
