class UsersController < ApplicationController

  # GET /users/1
  # GET /users/1.js
  # Returns every game that the player is joining
  def show
    respond_to do |format|
      format.js {
        @all_game_players = GamePlayer.where(:user_id => params[:id]) #,
                                             #:game_id != params[:current_game_id])
        @current_game_id = params[:current_game_id]

        # Append the game name to show in dropdown
        @all_game_players.each do |each_game_player|
          each_game_player[:game_name] = each_game_player.game.name
        end

        @all_game_players
      }
    end
  end
end
