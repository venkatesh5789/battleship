class GameMovesController < ApplicationController

  respond_to :xml, :html, :json

  def create
    #@input_game_move = GameMove.new(params[:carrier])

    #parsed_json = JSON.parse(params[:data])
    #params[:data][1.to_s]["row"]
    @ship_placement_notifications = []

    # type_of_move
    # 0: Nothing
    # 1: Patrol boat
    # 2: Submarine
    # 3: Destroyer
    # 4: Battleship
    # 5: Carrier

    5.times do |i|
      game_id = params[:data][i.to_s]["game_id"].to_i
      from_user_id = params[:data][i.to_s]["from_user_id"].to_i
      to_user_id = params[:data][i.to_s]["to_user_id"].to_i
      start_row = params[:data][i.to_s]["row"].to_i
      start_column = params[:data][i.to_s]["column"].to_i
      type_of_move =  params[:data][i.to_s]["type_of_move"].to_i
      ship_alignment = params[:data][i.to_s]["ship_alignment"].to_i

      size_of_ship = 0
      size_of_ship = 5 if type_of_move == 5
      size_of_ship = 4 if type_of_move == 4
      size_of_ship = 3 if type_of_move == 3 || type_of_move == 2
      size_of_ship = 2 if type_of_move == 1

      @ship_placement_notifications.push(GameMove.new(game_id:game_id,from_user_id:from_user_id,to_user_id:to_user_id,
                                                      column:start_column,row:start_row,
                                                      type_of_move:type_of_move,ship_alignment:ship_alignment))

      # Add records for every ship cell position
      # 5 + 4 + 3 + 3 + 2 = 17 total records
      size_of_ship.times do |delta|
        #puts delta
        g = GameMove.new(game_id:game_id,from_user_id:from_user_id,to_user_id:to_user_id,
                                  type_of_move:type_of_move,ship_alignment:ship_alignment);
        if ship_alignment == 0
          g.column = (start_column+delta).to_i
          g.row = start_row.to_i
        else
          g.column = start_column.to_i
          g.row = (start_row+delta).to_i
        end

        if g.save
          puts "ok"
          else
          puts "failed"
        end
      end
      puts "---"
    end

    respond_to do |format|
      format.js { @ship_placement_notifications }
    end

  end

  # GET /game_moves/1
  # GET /game_moves/1.json
  def show
    @game_move = GameMove.find(params[:id])
    respond_with @game_move
  end

  # GET /game_moves
  # GET /game_moves.json
  # This is called when a player request all game moves
  # Parameter: from_game_player_number
  #             to_game_player_number
  #             game_id
  def index

    # Convert player_number to user_id to append in @game_moves search result
    from_user_id = GamePlayer.where(:player_number=>params[:from_game_player_number],
                                    :game_id => params[:game_id]).first.user_id
    # Convert to_player_number to to_user_id to query in GameMove & append in @game_moves search result
    to_user_id = GamePlayer.where(:player_number=>params[:to_game_player_number],
                                      :game_id => params[:game_id]).first.user_id
    puts "----"
    puts params[:from_game_player_number]
    puts from_user_id
    puts params[:to_game_player_number]
    puts to_user_id
    puts "===="
    # Query for every row with game_id and to_user_id
    @game_moves = GameMove.where(:game_id => params[:game_id],
                                 :to_user_id => to_user_id)

    # Append from_game_player_number & to_game_player_number to @game_moves query result
    @game_moves.each do |each_game_move|
      each_game_move[:from_game_player_number] = params[:from_game_player_number].to_i
      each_game_move[:to_game_player_number] = params[:to_game_player_number].to_i
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @game_moves }
    end
  end
end
