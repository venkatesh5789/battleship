# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game_move, :class => 'GameMoves' do
    game_id 1
    from_user_id 1
    to_user_id 1
    row 1
    column 1
  end
end
