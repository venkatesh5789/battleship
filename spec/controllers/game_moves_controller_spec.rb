require 'spec_helper'
require 'capybara/rspec'

describe GameMovesController do


=begin
  describe "placing ship" do

    before do
      Game.create(name:"Lovely game",status:0)
      User.create(name:"Knotty")
      UserInGame.create(game_id:1,user_id:1,status:0)
      visit "/games/1"
      #puts page.html
    end

    let(:place) {"Place"}
    let(:ready) {"Ready to play"}

    #it "should add 17 rows to GameMove after placed all ships and clicked on ready" do
     # select "Carrier", :from => "ship_type"
      #click_button place

      #page.has_selector?("div#test", :text => "fdskljksdf")
      #page.has_content?("fdsfds")

      select "Battleship", :from => "ship_type"
      select "B", :from => "ship_row"
      click_button place

      select "Destroyer", :from => "ship_type"
      select "C", :from => "ship_row"
      click_button place

      select "Submarine", :from => "ship_type"
      select "D", :from => "ship_row"
      click_button place

      select "Patrol Boat", :from => "ship_type"
      select "E", :from => "ship_row"
      click_button place

      #expect { click_button ready }.to change { GameMove.count }.by(17)

      click_button ready
      sleep 1.seconds
      UserInGame.find(1).status.should equal(1)

    end
  end
=end

end
