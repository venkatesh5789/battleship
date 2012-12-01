class AddGameIdToChat < ActiveRecord::Migration
  def change
    add_column :chats, :game_id, :integer
  end
end
