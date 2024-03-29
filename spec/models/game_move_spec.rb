require 'spec_helper'

describe GameMove do

  before do
    @game_move = GameMove.new(game_id:1, row:2, column:3, from_user_id:1, to_user_id:1,
                              type_of_move:5, ship_alignment:1, ship_sunk_number:4)
  end

  subject { @game_move }

  it { should respond_to(:game_id) }
  it { should respond_to(:row) }
  it { should respond_to(:column) }
  it { should respond_to(:from_user_id) }
  it { should respond_to(:to_user_id) }
  it { should respond_to(:type_of_move) }
  it { should respond_to(:ship_alignment) }
  it { should respond_to(:ship_sunk_number) }

  describe "when game_id is below zero" do
    before { @game_move.game_id = -1 }
    it { should_not be_valid }
  end

  describe "when row is below zero" do
    before { @game_move.row = -1 }
    it { should_not be_valid }
  end

  describe "when row is above 9" do
    before { @game_move.row = 10 }
    it { should_not be_valid }
  end

  describe "when column is below zero" do
    before { @game_move.column = -1 }
    it { should_not be_valid }
  end

  describe "when column is above 9" do
    before { @game_move.column = 10 }
    it { should_not be_valid }
  end

  describe "when from_user_id is below zero" do
    before { @game_move.from_user_id = -1 }
    it { should_not be_valid }
  end

  describe "when to_user_id is below zero" do
    before { @game_move.to_user_id = -1 }
    it { should_not be_valid }
  end

  describe "when type_of_move is not in range 0..7 (below zero)" do
    before { @game_move.type_of_move = -1 }
    it { should_not be_valid }
  end

  describe "when type_of_move is not in range 0..7 (above seven)" do
    before { @game_move.type_of_move = 8 }
    it { should_not be_valid }
  end

  describe "when ship_alignment is invalid (below zero)" do
    before { @game_move.ship_alignment = -1 }
    it { should_not be_valid }
  end

  describe "when ship_alignment is invalid (above one)" do
    before { @game_move.ship_alignment = 2 }
    it { should_not be_valid }
  end

  describe "when save a new record" do
    it "should save if all fields are okay" do
      expect{ @game_move.save }.to change{GameMove.count}.by(1)
    end
    it "should not save when game_id is nil" do
      @game_move.game_id = nil
      expect{ @game_move.save }.to change{GameMove.count}.by(0)
    end
  end

  describe "when ship_sunk_number is not in range 0..5 (below zero)" do
    before { @game_move.ship_sunk_number = -1 }
    it { should_not be_valid }
  end

  describe "when ship_sunk_number is not in range 0..5 (above five)" do
    before { @game_move.ship_sunk_number = 6 }
    it { should_not be_valid }
  end
end