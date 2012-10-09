class GameMovesController < ApplicationController

  respond_to :xml, :html, :json
  def create
    @game_move = GameMove.new(params)
    @game_move.save
    respond_with @game_move

  end
end
