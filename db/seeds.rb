# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."
Idea.destroy_all
User.destroy_all
Vote.destroy_all

puts "Creating demo user..."

demo_user = User.new(
  first_name: "Joanna",
  last_name: "Lisiak",
  email: "joanna@gmail.com",
  password: "123456",
  address: "Ruyschstraat 401, 1091 MS Amsterdam"
  )
demo_user.save!
puts "User #{demo_user.first_name} created"

puts "Creating users & ideas..."



# puts "creating cocktail 3..."
# cocktail_3 = Cocktail.new(name: "Pau's Piña Colada")
# cocktail_3_picture = URI.open('https://images.unsplash.com/photo-1582633987110-6b4ca43e9a49?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80')
# cocktail_3.photo.attach(io: cocktail_3_picture, filename: 'ginto.png', content_type: 'image/png')
# cocktail_3.save!



# SIX USERS & SIX IDEAS

first_user = User.new(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Wagenaarstraat 32, 1093 CR Amsterdam"
  )
first_user.save!
puts "User #{first_user.first_name} created"
  
first_idea = Idea.new(
  title: "Oosterpark Dark at Night",
  problem: "After work I often go for a walk to Oosterpark, since it's just 5 minutes away from my apartment. I love this routine, it really calms me down, especially now when I rarely leave home. Unfortunately it's so so dark at night! The main alley is lit but it gets boring to walk the same path every night...",
  solution: "I suggest we install more lamps in the park, not only on the main alley. Perahps we can use some solar-powered ones? Perhaps we can arrange a crowdfunding? This was all of us who feel uneasy in the darkness can enjoy more of our beautiful park.",
  address: "Oosterpark, 1092 CA Amsterdam",
  user: first_user
  )
first_idea.save!
puts "Idea #{first_idea.title} of #{first_idea.user.first_name} created"

    
second_user = User.new(
first_name: Faker::Name.female_first_name,
last_name: Faker::Name.last_name,
email: Faker::Internet.email,
password: "123456",
address: "Leidsestraat 31, 1017 NT Amsterdam"
)
second_user.save!
puts "User #{second_user.first_name} created"
  
second_idea = Idea.new(
  title: "Benches for Watchers!",
  problem: "My problem is simple. I am a people watcher - I like observing the city life. There is this favourtite spot of mine and oh how I wish there was a nice bench there!",
  solution: "My solution is even simpler. Let's have a bench!",
  address: "Nieuwe Spiegelstraat 1, 1017 DB Amsterdam",
  user: second_user
)
second_idea.save!
puts "Idea #{second_idea.title} of #{second_idea.user.first_name} created"


third_user = User.new(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Wagenaarstraat 34 Amsterdam"
)
third_user.save!
puts "User #{third_user.first_name} created"


fourth_user = User.new(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Wagenaarstraat 34 Amsterdam"
)
fourth_user.save!
puts "User #{fourth_user.first_name} created"


# 14 USERS

puts "Creating users..."

7.times do
  user = User.new(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    address: "Amsterdam"
  )
  puts "User #{user.first_name} created"
end

7.times do
  user = User.new(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    address: "Amsterdam"
  )
  puts "User #{user.first_name} created"
end


# 80 VOTES

puts "Creating votes..."

  80.times do
  vote = Vote.new(
  user: User.all.sample,
  idea: Idea.last
  )
  vote.save!
  puts "Vote for #{vote.idea.title} created"
end


puts "Finished!"
