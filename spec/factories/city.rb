require 'faker'

FactoryGirl.define do
 factory :city do 
  name { Faker::Company.name }
  address { Faker::Address.city }
  postcode { Faker::Address.zip_code }
  # telephone { Faker::PhoneNumber.phone_number }
  # website { Faker::Internet.domain_name }
  telephone "043-244-0000"
  website "http://www.example.com"
  email { Faker::Internet.email }
  vision { Faker::Lorem.sentences(sentence_count = 3, supplemental = false) }
  mission { Faker::Lorem.sentences(sentence_count = 3, supplemental = false) }
  development_thrust { Faker::Lorem.sentences(sentence_count = 3, supplemental = false) }

  factory :invalid_city do
   name nil
  end

 end
end

