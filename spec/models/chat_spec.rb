require 'spec_helper'
require 'capybara/rspec'

describe "Chat model test" do

  before do
    @chat = Chat.new(from_user_id:1, message:"ffffffuuuuu", game_id:1)
  end

  subject { @chat }

  it { should respond_to(:from_user_id) }
  it { should respond_to(:message) }
  it { should respond_to(:game_id) }

  describe "when chat message is blank" do
    before { @chat.message = "" }
    it { should_not be_valid }
  end

end

=begin
describe "Add chats message" do

  subject { page }

  before do
    game = Game.create(name:"Lovely game",status:0)
    User.create(username:"Knotty")
    GamePlayer.create(game_id:1,user_id:1,status:0)

    #puts page.html
  end

  it 'should fuck yourself' do
    visit "/games/1"
    let(:send) {"send"}
    fill_in 'message', :with => 'fuck off naja'
    expect { click_button send }.to change { Chat.count }.by(1)
  end

end
=end