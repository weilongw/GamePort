# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    comment "MyString"
    user_id 1
    game_id 1
  end
end
