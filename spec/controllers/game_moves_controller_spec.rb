require 'spec_helper'

describe GameMovesController do

  before do
    @game_move = GameMove.new(game_id:1, row:2, column:3, from_user_id:1, to_user_id:1, type_of_move:1, type_of_ship:5)
  end

  subject { @game_move }

  it { should respond_to(:game_id) }
  it { should respond_to(:row) }
  it { should respond_to(:column) }
  it { should respond_to(:from_user_id) }
  it { should respond_to(:to_user_id) }
  it { should respond_to(:type_of_move) }
  it { should respond_to(:type_of_ship) }

end
