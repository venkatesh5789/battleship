class GameMove < ActiveRecord::Base
  attr_accessible :column, :from_user_id, :game_id, :row, :to_user_id,
                  :type_of_move, :type_of_ship, :ship_alignment,:commit

  belongs_to :game

end
