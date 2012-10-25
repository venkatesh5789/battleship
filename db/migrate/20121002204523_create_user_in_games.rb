class CreateUserInGames < ActiveRecord::Migration
  def change
    create_table :game_players do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :status

      t.timestamps
    end
  end
end
