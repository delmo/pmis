require 'faker'

FactoryGirl.define do
 factory :relation do
  title { Faker::Lorem.words(num=3, supplemental = false) }
  description { Faker::Lorem.sentence(word_count=5, supplemental = false) }
  justification { Faker::Lorem.sentences(sentence_count=3, supplemental = false) }

  factory :invalid_contact do
   title nil
  end
 end
end
