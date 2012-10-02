class GameMoves < ActiveRecord::Base
  attr_accessible :column, :from_user_id, :game_id, :row, :to_user_id

end
