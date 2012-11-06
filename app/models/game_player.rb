# Meaning of status
#   0: Waiting
#   1: Ready/Playing
#       (The list will show "Ready" if game.status is 0, "Playing" if game.status is 1)
#   2: Left
#   3: Lost
#   4: Won

$GAME_PLAYER_STATUS_WAITING = 0
$GAME_PLAYER_STATUS_READY = 1
$GAME_PLAYER_STATUS_LEFT = 2
$GAME_PLAYER_STATUS_LOST = 3
$GAME_PLAYER_STATUS_WON = 4

$GAME_PLAYER_STATUS_WAITING_TEXT = "Waiting"
$GAME_PLAYER_STATUS_READY_TEXT = "Ready"
$GAME_PLAYER_STATUS_LEFT_TEXT = "Left game"
$GAME_PLAYER_STATUS_LOST_TEXT = "Lost"
$GAME_PLAYER_STATUS_WON_TEXT = "Won"

class GamePlayer < ActiveRecord::Base
  attr_accessible :game_id, :status, :user_id, :player_number, :is_in_turn,
      :is_ship1_sunk, :is_ship2_sunk, :is_ship3_sunk, :is_ship4_sunk, :is_ship5_sunk

  belongs_to :user, class_name: "User"
  belongs_to :game, class_name: "Game"

  validates_numericality_of :status, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 4
  validates_numericality_of :player_number, :greater_than_or_equal_to => 0
end
