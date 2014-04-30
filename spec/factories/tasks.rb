# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "MyString"
    description "MyText"
    start_date "2014-04-30"
    due_date "2014-04-30"
    done 1
    portfolio_id 1
  end
end
