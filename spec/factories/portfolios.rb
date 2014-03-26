# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :portfolio do
    issue nil
    source nil
    department nil
    title "MyString"
    description "MyText"
    performance_indicator "MyText"
    target "MyText"
    amount "9.99"
    start "2014-03-17"
    completion "2014-03-17"
    visible false
    is_risky false
    not_in_line false
    not_related false
    not_pest false
  end
end
