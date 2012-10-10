class GameMovesController < ApplicationController

  respond_to :xml, :html, :json

  def create
    @game_move = GameMove.new(params[:game_move])

    respond_to do |format|
      if @game_move.save
        format.js { @game_move }
      else
        format.js { "nnoooo" }
      end
    end
  end

  def show
    @game_move = GameMove.find(params[:id])
    respond_with @game_move
  end

  def index
    @game_moves = GameMove.all
    respond_with @game_moves
  end
end
