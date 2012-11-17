class GamePlayersController < ApplicationController

  # PUT /game_players/1
  # PUT /game_players/1.json
  def update

    if params[:id].eql?("0")
      # Parameters got from client are "game_id", "player_number"
      # So, he sent "id" as 0. We've to find that GamePlayer from game_id & player_number
      # ------------- Update ship sunk -------------
      @game_player = GamePlayer.where(:game_id => params[:game_id], :player_number => params[:player_number]).first;

      case params[:ship_sunk_number].to_i
        when 1
          @game_player.is_ship1_sunk = true
        when 2
          @game_player.is_ship2_sunk = true
        when 3
          @game_player.is_ship3_sunk = true
        when 4
          @game_player.is_ship4_sunk = true
        when 5
          @game_player.is_ship5_sunk = true
      end

      @game_player.save

      respond_to do |format|
        format.json { render json: @game_player }
      end

    else
      # -------------- Update player's status ---------------
      @game_player = GamePlayer.find(params[:id])
      @game_player.status = params[:status]
      @game_player.save

      # *************** Check whether everyone is ready *************
      is_everyone_ready = true
      @all_game_players_in_same_game = GamePlayer.where(:game_id => @game_player.game_id)
      @all_game_players_in_same_game.each do |each_game_player|
        #puts "====="
        #puts each_game_player.player_number
        #puts "-----"
        #puts each_game_player.status
        if each_game_player.status != $GAME_PLAYER_STATUS_READY
          is_everyone_ready = false
        end
      end

      # ************* Change game status to START when everyone is ready *************
      if is_everyone_ready
        puts "EVERYONE IS READY"

        # *** Change game status ***
        game = Game.find(@game_player.game_id)
        game.status = 1
        game.save

        # **** And give first player a turn ****
        giveATurn = true
        @all_game_players_in_same_game.each do |each_game_player|
          # Give a turn only to first player
          if giveATurn
            each_game_player.is_in_turn = true
            giveATurn = false
          else
            each_game_player.is_in_turn = false
          end
          each_game_player.save
        end

      else
        puts "Not everyone is ready"
      end

      respond_to do |format|
        format.json { render json: @game_player }
      end

    end


  end

  # GET /game_players
  # GET /game_players.json
  # This is called when a player request all game players
  # Parameter: game_id
  def index

    @game_players = GamePlayer.where(:game_id => params[:game_id])

    @game_players.each do |each_game_player|
      each_game_player[:username] = each_game_player.user.username
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js {
        @game_players
      }
      format.json { render json: @game_players }
    end
  end

  def show
    @game = Game.find(params[:game_id])

    redirect_to @game
  end


end
