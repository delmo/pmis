# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rank_criterium do
    criteria "MyString"
    description "MyText"
    weight "9.99"
  end
end
