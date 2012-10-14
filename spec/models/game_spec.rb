require 'spec_helper'

describe Game do

  before do
    @game = Game.new(name:"Peaceful battle",status:0)
  end

  subject { @game }

  it { should respond_to(:name) }
  it { should respond_to(:status) }

  it { should be_valid }

  describe "when name is not present" do
    before { @game.name = "" }
    it { should_not be_valid }
  end

  describe "when status is not present" do
    before { @game.status = nil }
    it { should_not be_valid }
  end

  describe "when status is not number" do
    before { @game.status = "a" }
    it { should_not be_valid }
  end

end
