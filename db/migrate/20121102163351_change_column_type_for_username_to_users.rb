class ChangeColumnTypeForUsernameToUsers < ActiveRecord::Migration
  def change
    change_column :users, :username, :string
  end

end
