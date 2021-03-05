# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Idea.destroy_all
User.destroy_all

puts "Creating users and ideas..."

# FIRST USER & FIRST IDEA

first_user = User.new(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Wagenaarstraat 32, 1093 CR Amsterdam",
  role: "resident"
  )
  first_user.save!
  puts "User #{first_user.first_name} created"
  
first_idea = Idea.new(
  title: "Oosterpark Dark at Night",
  problem: "After work I often go for a walk to Oosterpark, since it's just 5 minutes away from my apartment. I love this routine, it really calms me down, especially now when I rarely leave home. Unfortunately it's so so dark at night! The main alley is lit but it gets boring to walk the same path every night...",
  solution: "I suggest we install more lamps in the park, not only on the main alley. Perahps we can use some solar-powered ones? Perhaps we can arrange a crowdfunding? This was all of us who feel uneasy in the darkness can enjoy more of our beautiful park.",
  address: "Oosterpark, 1092 CA Amsterdam",
  image_url: "https://images.unsplash.com/photo-1504810935423-dbbe9a698963?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=882&q=80",
  user: first_user,
  goal: 300
  )
  first_idea.save!
  puts "Idea #{first_idea.title} of #{first_idea.user.first_name} created"



# SECOND USER & SECOND IDEA
    
second_user = User.new(
first_name: Faker::Name.female_first_name,
last_name: Faker::Name.last_name,
email: Faker::Internet.email,
password: "123456",
address: "Leidsestraat 31, 1017 NT Amsterdam",
role: "resident"
)
second_user.save!
puts "User #{second_user.first_name} created"
  
second_idea = Idea.new(
  title: "Benches for Watchers!",
  problem: "My problem is simple. I am a people watcher - I like observing the city life. There is this favourtite spot of mine and oh how I wish there was a nice bench there!",
  solution: "My solution is even simpler. Let's have a bench!",
  address: "Nieuwe Spiegelstraat 1, 1017 DB Amsterdam",
  image_url: "https://images.unsplash.com/photo-1561326598-8e19291f9c7b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80",
  user: second_user,
  goal: 100
)
second_idea.save!
puts "Idea #{second_idea.title} of #{second_idea.user.first_name} created"


# THIRD USER & THIRD IDEA

third_user = User.new(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Wagenaarstraat 34 Amsterdam",
  role: "resident"
)
third_user.save!
puts "User #{third_user.first_name} created"


# FOURTH USER & FOURTH IDEA

fourth_user = User.new(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "123456",
  address: "Wagenaarstraat 34 Amsterdam",
  role: "resident"
)
fourth_user.save!
puts "User #{fourth_user.first_name} created"


