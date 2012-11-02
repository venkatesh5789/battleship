class RenameUserInGamesToGamePlayers < ActiveRecord::Migration
  def change
    rename_table :user_in_games, :game_players
  end
end
