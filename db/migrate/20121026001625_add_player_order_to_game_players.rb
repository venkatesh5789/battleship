class AddPlayerOrderToGamePlayers < ActiveRecord::Migration
  def change
    add_column :game_players, :player_order, :string
  end
end
