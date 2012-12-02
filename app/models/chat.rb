class Chat < ActiveRecord::Base
  attr_accessible :from_user_id, :message, :game_id
  validates :message, :format => /\A[\w\.\-\+]+\z/
  validates :message   ,presence:true

  belongs_to :user
end
