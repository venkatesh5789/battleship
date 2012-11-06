class ChangePlayerOrderToPlayerNumberInGamePlayers < ActiveRecord::Migration
  def change
    rename_column :game_players, :player_order, :player_number
  end
end
