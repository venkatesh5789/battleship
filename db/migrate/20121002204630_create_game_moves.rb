class CreateGameMoves < ActiveRecord::Migration
  def change
    create_table :game_moves do |t|
      t.integer :game_id
      t.integer :from_user_id
      t.integer :to_user_id
      t.integer :row
      t.integer :column

      t.timestamps
    end
  end
end
