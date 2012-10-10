class GameMovesController < ApplicationController

  respond_to :xml, :html, :json

  def create
    @input_game_move = GameMove.new(params[:game_move])
    row = @input_game_move.row
    column = @input_game_move.column
    ship_alignment = @input_game_move.ship_alignment
    type_of_ship = @input_game_move.type_of_ship

    size_of_ship = 5 if type_of_ship == 5
    size_of_ship = 4 if type_of_ship == 4
    size_of_ship = 3 if type_of_ship == 3 || type_of_ship == 2
    size_of_ship = 2 if type_of_ship == 1

    size_of_ship.times do |delta|
      @game_move = GameMove.new(params[:game_move])
      @game_move.column += delta if ship_alignment == 0
      @game_move.row += delta if ship_alignment == 1
      @game_move.save
    end

    respond_to do |format|
      format.js { @input_game_move }
    end
=begin @game_move = GameMove.new(params[:game_move])

    respond_to do |format|
      if @game_move.save
        respond_with type_of_ship
        format.js { @game_move }
      else
        format.js { "nnoooo" }
      end
    end
=end
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
