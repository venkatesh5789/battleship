class Chat < ActiveRecord::Base
  attr_accessible :from_user_id, :message, :game_id

  belongs_to :user
end
