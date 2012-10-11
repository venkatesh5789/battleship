class GameMovesController < ApplicationController

  respond_to :xml, :html, :json

  def create
    #@input_game_move = GameMove.new(params[:carrier])

    #parsed_json = JSON.parse(params[:data])
        #params[:data][1.to_s]["row"]
    @ship_placement_notifications = []

    5.times do |i|
      start_row = params[:data][i.to_s]["row"].to_i
      start_column = params[:data][i.to_s]["column"].to_i
      type_of_ship =  params[:data][i.to_s]["ship_type"].to_i
      ship_alignment = params[:data][i.to_s]["alignment"].to_i

      size_of_ship = 5 if type_of_ship == 5
      size_of_ship = 4 if type_of_ship == 4
      size_of_ship = 3 if type_of_ship == 3 || type_of_ship == 2
      size_of_ship = 2 if type_of_ship == 1

      @ship_placement_notifications.push(GameMove.new(column:start_column,row:start_row,
                                         type_of_ship:type_of_ship,ship_alignment:ship_alignment))

      size_of_ship.times do |delta|
        @game_move = GameMove.new
        @game_move.column = (start_column+delta).to_i if ship_alignment == 0
        @game_move.row = (start_row+delta).to_i if ship_alignment == 1
        @game_move.type_of_ship = type_of_ship
        @game_move.ship_alignment = ship_alignment
        @game_move.save
      end
    end

    respond_to do |format|
      format.js { @ship_placement_notifications }
    end

=begin
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
