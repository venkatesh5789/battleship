# Meaning of status
#   0: Waiting
#   1: Started
#   2: Finished

$GAME_STATUS_WAITING = 0
$GAME_STATUS_STARTED = 1
$GAME_STATUS_FINISHED = 2

class Game < ActiveRecord::Base
  attr_accessible :name,:status
  has_many :users, through: :game_players, source: :user

  validates :name   ,presence:true
  validates :status ,numericality:true

end
