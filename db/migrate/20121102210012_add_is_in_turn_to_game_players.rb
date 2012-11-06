class AddIsInTurnToGamePlayers < ActiveRecord::Migration
  def change
    add_column :game_players, :is_in_turn, :boolean
  end
end
