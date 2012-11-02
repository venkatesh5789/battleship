class GamePlayer < ActiveRecord::Base
  attr_accessible :game_id, :status, :user_id, :player_number
  belongs_to :user, class_name: "User"
  belongs_to :game, class_name: "Game"
end
