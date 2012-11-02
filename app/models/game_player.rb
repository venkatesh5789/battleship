# Meaning of status
#   0: Waiting
#   1: Ready/Playing
#       (The list will show "Ready" if game.status is 0, "Playing" if game.status is 1)
#   2: Left
#   3: Lost
#   4: Won

class GamePlayer < ActiveRecord::Base
  attr_accessible :game_id, :status, :user_id, :player_number
  belongs_to :user, class_name: "User"
  belongs_to :game, class_name: "Game"
end
