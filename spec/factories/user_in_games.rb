# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_in_games do
    user_id 1
    game_id 1
    status 1
  end
end
