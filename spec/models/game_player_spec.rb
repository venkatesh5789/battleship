require 'spec_helper'

describe GamePlayer do

  before do
    @game_player = GamePlayer.new(user_id:1, game_id:2, status:0)
  end

  subject { @game_player }

  it { should respond_to(:user_id) }
  it { should respond_to(:game_id) }
  it { should respond_to(:status) }
  it { should respond_to(:player_number) }

end