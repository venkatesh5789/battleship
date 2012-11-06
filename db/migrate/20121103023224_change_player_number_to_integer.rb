class ChangePlayerNumberToInteger < ActiveRecord::Migration
  def change
    change_column :game_players, :player_number, :integer
  end
end
