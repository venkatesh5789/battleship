class User < ActiveRecord::Base
  attr_accessible :name, :password
  has_many :games, through: :user_in_games, source: :game
end
