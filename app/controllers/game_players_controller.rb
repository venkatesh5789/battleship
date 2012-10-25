class GamePlayersController < ApplicationController

  # PUT /game_players/1
  # PUT /game_players/1.json
  def update
    @game_player = GamePlayer.find_by_user_id(params[:user_id])
    @game_player.status = params[:status]

    respond_to do |format|
      if @game_player.save #@user_in_game.update_attributes(params[:status].to_s)
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        #format.json { head :no_content }
        format.js { @game_player }
      else
        #format.html { render action: "edit" }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
