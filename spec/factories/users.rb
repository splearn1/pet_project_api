FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    # password_digest { '<PASSWORD>' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
