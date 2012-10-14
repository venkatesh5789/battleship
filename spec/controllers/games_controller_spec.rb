require 'spec_helper'

describe GamesController do

 it ' should be able to create a game' do
   expect  {Game.create}.to change {Game.all.count}.by(1)
 end

  it 'should be able to destroy a game' do
    @game = Game.create
    expect  {@game.destroy}.to change {Game.all.count}.by(-1)
  end

  it 'should have at least one user in game to exist' do

    Game.all.each  do |single_game|
       UserInGame.find_all_by_game_id(single_game[:id]).length.should >0
    end


  end

end
