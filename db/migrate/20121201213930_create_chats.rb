class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :from_user_id
      t.string :message

      t.timestamps
    end
  end
end
