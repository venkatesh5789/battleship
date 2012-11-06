require 'spec_helper'

=begin
describe UsersController do

  it ' should be able to create a game' do
    expect  {User.create}.to change {User.all.count}.by(1)
  end

  it 'should be able to destroy a game' do
    @user = User.create
    expect  {@user.destroy}.to change {User.all.count}.by(-1)
  end

end
=end