# Meaning of status
#   0: Waiting
#   1: Started
#   2: Finished

class Game < ActiveRecord::Base
  attr_accessible :name,:status
  has_many :users, through: :game_players, source: :user

  validates :name   ,presence:true
  validates :status ,numericality:true

end
