# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing records
User.destroy_all
Hobby.destroy_all

# Seed cities
cities = %w[Berlin]
5.times do
  cities << Faker::Address.city
end

# Seed Users
25.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: cities.sample
  )
end

# Seed Hobbies
10.times do
  Hobby.create!(
    name: Faker::Hobby.unique.activity
  )
end

# Associate Hobbies with Users
User.all.each do |user|
  user.hobbies << Hobby.all.sample(rand(1..5))
end
