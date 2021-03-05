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

puts "Creating demo user & her ideas..."

demo_user = User.new(
  first_name: "Maria",
  last_name: "Peszek",
  email: "joanna@gmail.com",
  password: "123456",
  address: "Ruyschstraat 401, 1091MS Amsterdam"
)
demo_user_image = URI.open("https://images.unsplash.com/photo-1477118476589-bff2c5c4cfbb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
demo_user.photo.attach(io: demo_user_image, filename: "female4.png", content_type: "image/png")
demo_user.save!
puts "User #{demo_user.first_name} created"

demo_idea = Idea.new(
  title: "Paper Trash Flying Around",
  problem: "After work I often go for a walk to Oosterpark, since it's just 5 minutes away from my apartment. I love this routine, it really calms me down, especially now when I rarely leave home. Unfortunately it's so so dark at night! The main alley is lit but it gets boring to walk the same path every night...",
  solution: "I suggest we install more lamps in the park, not only on the main alley. Perahps we can use some solar-powered ones? Perhaps we can arrange a crowdfunding? This was all of us who feel uneasy in the darkness can enjoy more of our beautiful park.",
  address: "Ruyschstraat 401, 1091MS Amsterdam",
  user: demo_user
  )
demo_idea_image = URI.open("https://images.unsplash.com/photo-1528323273322-d81458248d40?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2301&q=80")
demo_idea.photo.attach(io: demo_idea_image, filename: "trash.png", content_type: "image/png")
demo_idea.save!
puts "Idea #{demo_idea.title} of #{demo_idea.user.first_name} created"


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
  address: "Wagenaarstraat 32, 1093CR Amsterdam"
)
first_user_image = URI.open("https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
first_user.photo.attach(io: first_user_image, filename: "female1.png", content_type: "image/png")
first_user.save!
puts "User #{first_user.first_name} created"
  
first_idea = Idea.new(
  title: "Oosterpark Dark at Night",
  problem: "After work I often go for a walk to Oosterpark, since it's just 5 minutes away from my apartment. I love this routine, it really calms me down, especially now when I rarely leave home. Unfortunately it's so so dark at night! The main alley is lit but it gets boring to walk the same path every night...",
  solution: "I suggest we install more lamps in the park, not only on the main alley. Perahps we can use some solar-powered ones? Perhaps we can arrange a crowdfunding? This was all of us who feel uneasy in the darkness can enjoy more of our beautiful park.",
  address: "Oosterpark, 1092CA Amsterdam",
  user: first_user
  )
first_idea_image = URI.open("https://images.unsplash.com/photo-1600075078247-8e01faaa44a2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
first_idea.photo.attach(io: first_idea_image, filename: "park.png", content_type: "image/png")
first_idea.save!
puts "Idea #{first_idea.title} of #{first_idea.user.first_name} created"

    
second_user = User.new(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Leidsestraat 31, 1017NT Amsterdam"
)
second_user_image = URI.open("https://images.unsplash.com/photo-1487573884658-a5d3c667584e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1984&q=80")
second_user.photo.attach(io: second_user_image, filename: "female2.png", content_type: "image/png")
second_user.save!
puts "User #{second_user.first_name} created"
  
second_idea = Idea.new(
  title: "Benches for Watchers!",
  problem: "My problem is simple. I am a people watcher - I like observing the city life. There is this favourtite spot of mine and oh how I wish there was a nice bench there!",
  solution: "My solution is even simpler. Let's have a bench!",
  address: "Plantage Lepellaan, 1018DL Amsterdam",
  user: second_user
)
second_idea_image = URI.open("https://images.unsplash.com/photo-1561326598-8e19291f9c7b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
second_idea.photo.attach(io: second_idea_image, filename: "bench.png", content_type: "image/png")
second_idea.save!
puts "Idea #{second_idea.title} of #{second_idea.user.first_name} created"


third_user = User.new(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Veemarkt 29, 1019CM Amsterdam"
)
third_user_image = URI.open("https://images.unsplash.com/photo-1541733457537-fa8fa3cc6a01?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2689&q=80")
third_user.photo.attach(io: third_user_image, filename: "female3.png", content_type: "image/png")
third_user.save!
puts "User #{third_user.first_name} created"

third_idea = Idea.new(
  title: "Minigolf in Funenpark",
  problem: "My problem is simple. I am a people watcher - I like observing the city life. There is this favourtite spot of mine and oh how I wish there was a nice bench there!",
  solution: "My solution is even simpler. Let's have a bench!",
  address: "Funenpark, 1018AK Amsterdam",
  user: third_user
)
third_idea_image = URI.open("https://images.unsplash.com/photo-1593111774642-a746f5006b7b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2275&q=80")
third_idea.photo.attach(io: third_idea_image, filename: "minigolf.png", content_type: "image/png")
third_idea.save!
puts "Idea #{third_idea.title} of #{third_idea.user.first_name} created"


fourth_user = User.new(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Populierenweg 64, 1092ER Amsterdam"
)
fourth_user_image = URI.open("https://images.unsplash.com/photo-1605462863863-10d9e47e15ee?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
fourth_user.photo.attach(io: fourth_user_image, filename: "male1.png", content_type: "image/png")
fourth_user.save!
puts "User #{fourth_user.first_name} created"

fourth_idea = Idea.new(
  title: "Tired of Dirty Windows",
  problem: "My problem is simple. I am a people watcher - I like observing the city life. There is this favourtite spot of mine and oh how I wish there was a nice bench there!",
  solution: "My solution is even simpler. Let's have a bench!",
  address: "Populierenweg 64, 1092ER Amsterdam",
  user: fourth_user
)
fourth_idea_image = URI.open("https://images.unsplash.com/photo-1518662932499-75af27874c30?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
fourth_idea.photo.attach(io: fourth_idea_image, filename: "windows.png", content_type: "image/png")
fourth_idea.save!
puts "Idea #{fourth_idea.title} of #{fourth_idea.user.first_name} created"


fifth_user = User.new(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Commelinstraat 470, 1093VD Amsterdam"
)
fifth_user_image = URI.open("https://images.unsplash.com/photo-1546888673-4db7ff10251a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
fifth_user.photo.attach(io: fifth_user_image, filename: "male2.png", content_type: "image/png")
fifth_user.save!
puts "User #{fifth_user.first_name} created"

fifth_idea = Idea.new(
  title: "Dappermarkt Infrastructure",
  problem: "My problem is simple. I am a people watcher - I like observing the city life. There is this favourtite spot of mine and oh how I wish there was a nice bench there!",
  solution: "My solution is even simpler. Let's have a bench!",
  address: "Dappermarkt, 1093BX Amsterdam",
  user: fifth_user
)
fifth_idea_image = URI.open("https://images.unsplash.com/photo-1533900298318-6b8da08a523e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
fifth_idea.photo.attach(io: fifth_idea_image, filename: "market.png", content_type: "image/png")
fifth_idea.save!
puts "Idea #{fifth_idea.title} of #{fifth_idea.user.first_name} created"


sixth_user = User.new(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Domselaerstraat 90, 1093MB Amsterdam"
)
sixth_user_image = URI.open("https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
sixth_user.photo.attach(io: sixth_user_image, filename: "male3.png", content_type: "image/png")
sixth_user.save!
puts "User #{sixth_user.first_name} created"

sixth_idea = Idea.new(
  title: "Greener Playground",
  problem: "My problem is simple. I am a people watcher - I like observing the city life. There is this favourtite spot of mine and oh how I wish there was a nice bench there!",
  solution: "My solution is even simpler. Let's have a bench!",
  address: "Domselaerstraat 121, 1093MB Amsterdam",
  user: sixth_user
)
sixth_idea_image = URI.open("https://images.unsplash.com/photo-1596997000103-e597b3ca50df?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1934&q=80")
sixth_idea.photo.attach(io: sixth_idea_image, filename: "playgournd.png", content_type: "image/png")
sixth_idea.save!
puts "Idea #{sixth_idea.title} of #{sixth_idea.user.first_name} created"


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
  idea: Idea.all.sample
  )
  vote.save!
  puts "Vote for #{vote.idea.title} created"
end


puts "Finished!"
