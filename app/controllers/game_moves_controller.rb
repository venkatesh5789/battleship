class GameMovesController < ApplicationController

  respond_to :xml, :html, :json

  def create

    @game_move_notifications = []

    # Loop through each game_move (there are more than 1 game_move if they're ship placements)
    params[:data].count.times do |i|
      game_id = params[:data][i.to_s]["game_id"].to_i
      from_user_id = params[:data][i.to_s]["from_user_id"].to_i


      if params[:data][i.to_s]["to_user_id"].blank?
        # If the client send "target_player_number", the server has to convert it to "to_user_id"
        target_player_number = params[:data][i.to_s]["target_player_number"]

        to_user_id = GamePlayer.where(:player_number=>target_player_number,:game_id => game_id).first.user_id
      else
        # Otherwise, use "to_user_id"
        to_user_id = params[:data][i.to_s]["to_user_id"].to_i
      end

      start_row = params[:data][i.to_s]["row"].to_i
      start_column = params[:data][i.to_s]["column"].to_i
      type_of_move =  params[:data][i.to_s]["type_of_move"].to_i
      ship_alignment = params[:data][i.to_s]["ship_alignment"].to_i

      size_of_ship = 1  # Create game_move record for 1 time, if it's a hit or miss
      # Otherwise, create n time depends on ship size
      size_of_ship = 5 if type_of_move == 5
      size_of_ship = 4 if type_of_move == 4
      size_of_ship = 3 if type_of_move == 3 || type_of_move == 2
      size_of_ship = 2 if type_of_move == 1

      if ((type_of_move == 6) || (type_of_move == 7 ))
      @game_move_notifications = GameMove.where(:game_id => params[:data][i.to_s]["game_id"].to_i, :type_of_move => [6,7] )
      end

      @game_move_notifications.push(GameMove.new(game_id:game_id,from_user_id:from_user_id,to_user_id:to_user_id,
                                                      column:start_column,row:start_row,
                                                      type_of_move:type_of_move,ship_alignment:ship_alignment))
      @game_move_notifications.reverse!
      # If it's a ship position, add records for every ship cell position --> 5 + 4 + 3 + 3 + 2 = 17 total records
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
          puts "ok to create game_moves record"
          else
          puts "failed to create game_moves record"
        end
      end

      # -------- If this is shoot move, server do a turn management -------
      @game = Game.find(game_id)
      if @game.status == $GAME_STATUS_STARTED
        @all_game_players_in_same_game = GamePlayer.where(:game_id=>game_id)

        # Find who has a current turn
        turn_owner_index = 0
        @all_game_players_in_same_game.each do |each_game_player|
          if (each_game_player.is_in_turn?)
            each_game_player.is_in_turn = 0
            puts "***"
            if each_game_player.save
              puts "ok"
            else
              puts "failed"
            end
            break
          end
          turn_owner_index = turn_owner_index+1
        end
        # Find next player_number
        next_turn_owner_index = turn_owner_index
        @all_game_players_in_same_game.length.times do |i|
          next_turn_owner_index = (next_turn_owner_index+1) % @all_game_players_in_same_game.length
          # Check if he deserves turn
          if @all_game_players_in_same_game[next_turn_owner_index].status == $GAME_PLAYER_STATUS_READY
            #next_turn_player_number = @all_game_players_in_same_game[next_turn_owner_index].player_number
            #next_turn_game_player = GamePlayer.where(:game_id=>game_id,:player_number=>next_turn_player_number).first
            next_turn_game_player = @all_game_players_in_same_game[next_turn_owner_index]
            puts "---"
            next_turn_game_player.is_in_turn = true
            if next_turn_game_player.save
              puts "okkkk"
            else
              puts "failleedd"
            end
            break
          end
        end
      end
    end


    respond_to do |format|
      format.js { @game_move_notifications }
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
