class UserInGamesController < ApplicationController

  # PUT /user_in_games/1
  # PUT /user_in_games/1.json
  def update
    @user_in_game = UserInGame.find_by_user_id(params[:user_id])
    @user_in_game.status = params[:status]

    respond_to do |format|
      if @user_in_game.save #@user_in_game.update_attributes(params[:status].to_s)
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        #format.json { head :no_content }
        format.js { @user_in_game }
      else
        #format.html { render action: "edit" }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
