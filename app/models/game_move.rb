# Meaning of type_of_move
#   0: Nothing
#   1: Ship 1 - Patrol boat (size = 2)
#   2: Ship 2 - Submarine (size = 3)
#   3: Ship 3 - Destroyer (size = 3)
#   4: Ship 4 - Battleship (size = 4)
#   5: Ship 5 - Carrier (size = 5)
#   6: Hit
#   7: Missed

# Meaning of ship_alignment
#   0: Horizontal (increasing column)
#   1: Vertical (increasing row)

# Meaning of from_user_id & to_user_id
#   These field store user's ID -- related to Users table

class GameMove < ActiveRecord::Base
  attr_accessible :column, :from_user_id, :game_id, :row, :to_user_id,
                  :type_of_move, :ship_alignment

  belongs_to :game

  validates_numericality_of :game_id, :greater_than_or_equal_to => 0

  validates_numericality_of :row, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 9
  validates_numericality_of :column, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 9

  validates_numericality_of :from_user_id, :greater_than_or_equal_to => 0
  validates_numericality_of :to_user_id, :greater_than_or_equal_to => 0

  validates_numericality_of :type_of_move, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 7
  validates_numericality_of :ship_alignment, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1
end
