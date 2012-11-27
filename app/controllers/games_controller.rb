class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show

    # Check whether user has already joined this game
    if(GamePlayer.where(:game_id => params[:id], :user_id => current_user.id).count == 0)
      # Not joined, create new game_player record to join the game
      new_player = GamePlayer.new
      new_player.user_id = current_user.id
      new_player.game_id = params[:id]
      new_player.status = $GAME_PLAYER_STATUS_WAITING
      new_player.player_number = GamePlayer.where(:game_id => params[:id]).count   # get a new player number
      new_player.is_ship1_sunk=false
      new_player.is_ship2_sunk=false
      new_player.is_ship3_sunk=false
      new_player.is_ship4_sunk=false
      new_player.is_ship5_sunk=false
      new_player.is_in_turn=false
      new_player.save
    end

    # Get game_player record for this player
    @current_game_player = GamePlayer.where(:game_id => params[:id], :user_id => current_user.id).first
    if @current_game_player
      @current_game_player_number = @current_game_player.player_number
      @current_game_player_status = @current_game_player.status
    end

    # Successfully joined or just continue the game
    @game = Game.find(params[:id])
    # For a new move
    @game_move = GameMove.new
    # List of games that this user has joined
    @user_joined_games = GamePlayer.where(:user_id=>current_user.id).order("player_number asc")
    # For players table
    @game_players = GamePlayer.find_all_by_game_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create

    # Create a new record of "games" to create a new game
    @game = Game.new(params[:game])
    @game.status = $GAME_STATUS_WAITING

    respond_to do |format|
      if @game.save
        # Create a new "game_player" for this game creator to join the game
        new_player = GamePlayer.new(:user_id => current_user.id,
                                    :game_id => @game.id,
                                    :player_number=> 0,  # first player number starts with zero
                                    :status => $GAME_PLAYER_STATUS_WAITING )
        new_player.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])
    @game.status = params[:status];
    @game.save

    respond_to do |format|
      format.json { render json: @game }
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end
