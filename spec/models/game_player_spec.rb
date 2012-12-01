require 'spec_helper'

describe GamePlayer do

  before do
    @game_player = GamePlayer.new(user_id:1, game_id:2, status:0, player_number:0)
  end

  subject { @game_player }

  it { should respond_to(:user_id) }
  it { should respond_to(:game_id) }
  it { should respond_to(:status) }
  it { should respond_to(:player_number) }
  it { should respond_to(:is_in_turn) }
  it { should respond_to(:is_ship1_sunk) }
  it { should respond_to(:is_ship2_sunk) }
  it { should respond_to(:is_ship3_sunk) }
  it { should respond_to(:is_ship4_sunk) }
  it { should respond_to(:is_ship5_sunk) }


  describe "when game player status is below zero" do
    before { @game_player.status = -1 }
    it { should_not be_valid }
  end
  describe "when game player status is above five" do
    before { @game_player.status = 6 }
    it { should_not be_valid }
  end

  describe "when game player number is below zero" do
    before { @game_player.player_number = -1 }
    it { should_not be_valid }
  end

end