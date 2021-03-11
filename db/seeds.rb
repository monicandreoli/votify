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
Message.destroy_all
User.destroy_all
Vote.destroy_all
Chatroom.destroy_all

# MUNICIPALITY SIDE

# MUNICIPALITY DEMO USER

puts "Creating municipality demo user, chat and messages..."
mun_user = User.new(
  first_name: "Zoe",
  last_name: "Bakker",
  email: "zoe@gmail.com",
  password: "123456",
  address: "Ruyschstraat 401, 1091MS Amsterdam",
  role: "municipality"
)
mun_user_image = URI.open("https://images.unsplash.com/photo-1502764613149-7f1d229e230f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2102&q=80")
mun_user.photo.attach(io: mun_user_image, filename: "female5.png", content_type: "image/png")
mun_user.save!
puts "User #{mun_user.first_name} created"

# CHATROOM

chatroom = Chatroom.new(
  name: "general"
)
chatroom.save!
puts "Chatroom #{chatroom.name} created"

# 3 MESSAGES 

message_one = Message.new(
  content: "Dear Residents! The paper trash pickup schedule has been changed. From now on the paper trash will be collected on Mondays between 8am and 10pm and on Thursday betweeen 8am and 10am.",
  chatroom: chatroom,
  user: mun_user
)
message_one.save!
puts "First message was created"

message_two = Message.new(
  content: "Dear Residents! From Tuesday 16.03.2021 new coronavirus measures are introduced. The curfew has been lifted and you can now leave home past 9pm. Please remember to wear masks in public spaces.",
  chatroom: chatroom,
  user: mun_user
)
message_two.save!
puts "Second message was created"

message_three = Message.new(
  content: "Dear Residents! We are happy to inform that the municipality of Amsterdam has joined Voitfy. Propose your ideas and help us make the city of Amsterdam a better place.",
  chatroom: chatroom,
  user: mun_user
)
message_three.save!
puts "Third message was created"


# RESIDENT SIDE

# RESIDENT DEMO USER & HER IDEA WITH FEEDBACK

puts "Creating resident demo user & her ideas..."

res_user = User.new(
  first_name: "Maria",
  last_name: "Peszek",
  email: "joanna@gmail.com",
  password: "123456",
  address: "Ruyschstraat 401, 1091MS Amsterdam"
)
res_user_image = URI.open("https://images.unsplash.com/photo-1477118476589-bff2c5c4cfbb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
res_user.photo.attach(io: res_user_image, filename: "female4.png", content_type: "image/png")
res_user.save!
puts "User #{res_user.first_name} created"

demo_idea_official = Idea.new(
  title: "Oosterpark Dark at Night",
  problem: "After work I often go for a walk to Oosterpark, since it's just 5 minutes away from my apartment. I love this routine, it really calms me down, especially now when I rarely leave home. Unfortunately it's so so dark at night! The main alley is lit but it gets boring to walk the same path every night...",
  solution: "I suggest we install more lamps in the park, not only on the main alley. Perahps we can use some solar-powered ones? Perhaps we can arrange a crowdfunding? This was all of us who feel uneasy in the darkness can enjoy more of our beautiful park.",
  address: "Oosterpark, 1092CA Amsterdam",
  user: res_user,
  goal: 20,
  status: "Approved"
  )
demo_idea_official_image = URI.open("https://images.unsplash.com/photo-1600075078247-8e01faaa44a2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")
demo_idea_official.photo.attach(io: demo_idea_official_image, filename: "park.png", content_type: "image/png")
demo_idea_official.save!
puts "Idea #{demo_idea_official.title} of #{demo_idea_official.user.first_name} created"

# 18 NAKED VOTES

18.times do
  vote = Vote.new(
    user: User.all.sample,
    idea: demo_idea_official
  )
  vote.save!
  puts "Vote for #{vote.idea.title} created"
end

# 4 FEEDBACK VOTES

feedback_one = Vote.new(
  user: User.all.sample,
  idea: demo_idea_official,
  comment: "Cool idea! I have the same problem."
)
feedback_one.save!
puts "Vote with feedback for #{feedback_one.idea.title} created"

feedback_two = Vote.new(
  user: User.all.sample,
  idea: demo_idea_official,
  comment: "I vote for it. Most of the year is dark - the more light, the merrier."
)
feedback_two.save!
puts "Vote with feedback for #{feedback_two.idea.title} created"

feedback_three = Vote.new(
  user: User.all.sample,
  idea: demo_idea_official,
  comment: "Hm, I'm not sure... Isn't the light on the main alley enough?"
)
feedback_three.save!
puts "Vote with feedback for #{feedback_three.idea.title} created"

feedback_four = Vote.new(
  user: User.all.sample,
  idea: demo_idea_official,
  comment: "Let's have a Latern Festival in Oosterpark! For sure it will be lit at least this one night <3"
)
feedback_four.save!
puts "Vote with feedback for #{feedback_four.idea.title} created"


# SIX USERS & SIX IDEAS

puts "Creating users & ideas..."

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
  title: "Paper Trash Flying Around",
  problem: "Fellow Neighbours! Have you also noticed that paper trash pickup seems to happen less often than needed? There is a lot of paper trash flying around on our street which gets particularily messy when it's raning... And it's rainig most of the time in the Netherlands :)",
  solution: "Let's raise enough votes to change the trash pickup schedule! Maybe instead of only Thursday mornings we could arrange Monday mornings as well?",
  address: "Wagenaarstraat 32, 1093CR Amsterdam",
  user: first_user,
  goal: 18
  )
first_idea_image = URI.open("https://images.unsplash.com/photo-1517457373958-b7bdd4587205?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=8")
first_idea.photo.attach(io: first_idea_image, filename: "trash.png", content_type: "image/png")
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
  problem: "My 'problem' is simple. I am a people watcher - I like observing the city life. There is this favourtite spot of mine and oh how I wish there was a nice bench there!",
  solution: "My solution is even simpler. Let's have a bench!",
  address: "Plantage Lepellaan, 1018DL Amsterdam",
  user: second_user,
  goal: 12
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
  problem: "Any minigolf fans around here? I've always wanted to play some golf, but going to the real field is a long trip.",
  solution: "Having a minigolf field in Funenpark would we awesome. I don't think it requires much inter",
  address: "Funenpark, 1018AK Amsterdam",
  user: third_user,
  goal: 24
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
  problem: "Some of the windows don't open in my house and I live on the fifth floor. How do I ever clean them? Has any of you had the same problem or am I just missing something?",
  solution: "Clean Window Saturday: we chip in for a very long stick and tackle those stains! It would be ideal if the city could provide such a service in the future.",
  address: "Populierenweg 64, 1092ER Amsterdam",
  user: fourth_user,
  goal: 28,
  municipality: false
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
  problem: "Like some of you here, I am a local food producer who sells their goodies on Dappermarkt. The infrastructure is working, but there is always space for improvement.",
  solution: "The other day I was wondering how to make the place more attractive (and increase sales :) I did some research and found some cool permanent market stall solutions.",
  address: "Dappermarkt, 1093BX Amsterdam",
  user: fifth_user,
  goal: 16
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

# DEMO IDEA & ITS VOTES

sixth_idea = Idea.new(
  title: "Green Playground",
  problem: "I am a father of two and we like spending time outside. However, there is no playground close to my house and walking a long distance with a three-year old is not a piece of cake.",
  solution: "My suggestion is to build a new playground. It could be a theme playgournd oriented around plant varietes. It can be both entertaining and educational for kids. During my paternity leave I had some free time and designed a project so I am ready to discuss it in the municipality.",
  address: "Domselaerstraat 121, 1093MB Amsterdam",
  user: sixth_user,
  goal: 24
)
sixth_idea_image = URI.open("https://images.unsplash.com/photo-1596997000103-e597b3ca50df?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1934&q=80")
sixth_idea.photo.attach(io: sixth_idea_image, filename: "playground.png", content_type: "image/png")
sixth_idea.save!
puts "Idea #{sixth_idea.title} of #{sixth_idea.user.first_name} created"

23.times do 
  vote = Vote.new(
    user: User.all.sample,
    idea: sixth_idea
  )
  vote.save!
  puts "Vote for #{vote.idea.title} created"
end


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
  
  if User.all.where.not(id: 2)
    vote = Vote.new(
        user: User.all.sample,
        idea: Idea.all.sample
    )
  end
  vote.save!
  puts "Vote for #{vote.idea.title} created"
end

puts "Finished!"
