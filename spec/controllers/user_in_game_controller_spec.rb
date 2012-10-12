require 'spec_helper'

describe UserInGameController do
  describe "prereqs" do
    before do
      @user_in_game = UserInGame.new(user_id:1, game_id:2, status:0)
    end

    subject { @user_in_game }

    it { should respond_to(:user_id) }
    it { should respond_to(:game_id) }
    it { should respond_to(:status) }

  end

  describe "when user joins a game, user in game is created " do
    pending Kapil and Pujita need to write the code
  end

  describe "click on ready updates the user status to 1" do
    pending @user_in_game.save

  end

end
