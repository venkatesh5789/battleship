require 'spec_helper'
require 'capybara/rspec'

describe GameMovesController do

    describe "something" do
      before do
        @game_move = GameMove.new(game_id:1, row:2, column:3, from_user_id:1, to_user_id:1,
                                  type_of_move:1, type_of_ship:5, ship_alignment:1)
      end

      subject { @game_move }

      it { should respond_to(:game_id) }
      it { should respond_to(:row) }
      it { should respond_to(:column) }
      it { should respond_to(:from_user_id) }
      it { should respond_to(:to_user_id) }
      it { should respond_to(:type_of_move) }
      it { should respond_to(:type_of_ship) }
      it { should respond_to(:ship_alignment) }
    end
=begin
    describe "placing ship" do

      before do
        @game = Game.new(id:1,name:"Lovely game")
        @game.save
        visit "/games/1"
      end

      let(:submit) {"Place"}

      it "should make 5 rows for aircraft carrier" do
       expect { click_button submit }.to change { GameMove.count }.by(5)

      end

      it "should make 4 rows for battleship" do
        select "Battleship", :from => "game_move[type_of_ship]"
        expect { click_button submit }.to change { GameMove.count }.by(4)
      end

      it "should make 3 rows for destroyer" do
        select "Destroyer", :from => "game_move[type_of_ship]"
        expect { click_button submit }.to change { GameMove.count }.by(3)
      end

      it "should make 3 rows for submarine" do
        select "Submarine", :from => "game_move[type_of_ship]"
        expect { click_button submit }.to change { GameMove.count }.by(3)
      end

      it "should make 2 rows for patrol boat" do
        select "Patrol Boat", :from => "game_move[type_of_ship]"
        expect { click_button submit }.to change { GameMove.count }.by(2)
      end

      it "should increase row for vertical alignment" do
        select "V", :from => "game_move[ship_alignment]"
        click_button submit
        GameMove.find(1).row.should eq(0)
        GameMove.find(2).row.should eq(1)
        GameMove.find(3).row.should eq(2)
        GameMove.find(4).row.should eq(3)
        GameMove.find(5).row.should eq(4)
      end

      it "should increase column for horizontal alignment" do
        select "H", :from => "game_move[ship_alignment]"
        click_button submit
        GameMove.find(1).column.should eq(0)
        GameMove.find(2).column.should eq(1)
        GameMove.find(3).column.should eq(2)
        GameMove.find(4).column.should eq(3)
        GameMove.find(5).column.should eq(4)
      end
    end
=end

end
