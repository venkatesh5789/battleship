class Game < ActiveRecord::Base
  attr_accessible :name, :status
  has_many :users, through: :user_in_games, source: :user
end
