class GamePlayersController < ApplicationController

  # PUT /game_players/1
  # PUT /game_players/1.json
  def update
    # Update player's status
    @game_player = GamePlayer.find(params[:id])
    @game_player.status = params[:status]
    @game_player.save

    # Server then check if everyone is ready or not
    is_everyone_ready = true
    @all_game_players_in_same_game = GamePlayer.where(:game_id => @game_player.game_id)
    @all_game_players_in_same_game.each do |each_game_player|
      puts "====="
      puts each_game_player.player_number
      puts "-----"
      puts each_game_player.status
      if each_game_player.status != 1
        is_everyone_ready = false
        #break
      end
    end

    # if everyone is ready then update game.status = 1
    if is_everyone_ready
      puts "EVERYONE IS READY"
      game = Game.find(@game_player.game_id)
      game.status = 1
      if game.save
        puts "game status set"
      else
        puts "fuck"
      end
    else
      puts "not ready"
    end

    respond_to do |format|
      format.js { @game_player }
    end
  end

  # GET /game_players
  # GET /game_players.json
  # This is called when a player request all game players
  # Parameter: game_id
  def index

    @game_players = GamePlayer.where(:game_id => params[:game_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @game_players }
    end
  end

  def show
    @game = Game.find(params[:game_id])
    if(GamePlayer.where(:game_id => game.id, :user_id => current_user.id).count == 0)
      @player = GamePlayer.new
      @player.user_id = current_user.id
      @player.game_id = params[:game_id]
      @player.status = 0
      @player.player_number = GamePlayer.where(:game_id => params[:game_id]).count + 1
      @player.save
    end

    redirect_to @game
  end

  #def create
   # @game = Game.find(params[:game_id])
   # @player = GamePlayer.new
   # @player.user_id = current_user.id
   # @player.game_id = params[:game_id]
  #  @player.status = 0
  #  @player.player_number = GamePlayer.where(:game_id => params[:game_id]).count + 1
  #  @player.save

   # redirect_to @game




    #@new_game_player   = GamePlayer.new(params[:user_id])
    #@new_game_player.save


 # end


end
