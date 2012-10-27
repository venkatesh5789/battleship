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
