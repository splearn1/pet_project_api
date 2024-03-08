# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Vet.find_or_create_by!(email: "seely@vets.com") do |vet|
#     vet.name = "Dr. Seely"
#     vet.phone = "555-555-5555"
# end

number_of_vets = 3

# area_code = Faker::Number.number(digits: 3)
# subscriber_number = Faker::Number.number(digits: 7)
# phone_number = "#{area_code}-#{subscriber_number}"

number_of_vets.times do 

    Vet.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        # phone: phone_number
        phone: Faker::PhoneNumber.phone_number_with_country_code
    )
end