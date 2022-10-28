# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: "Garnacho Guedes", photo:"https://randomuser.me/api/portraits/men/33.jpg" , bio: "I am a chef on California Hard Rock Hotel")
User.create(name: "Viktoria Plzen", photo:"https://randomuser.me/api/portraits/women/21.jpg" , bio: "I am a Dancer in Cesars Palace")
User.create(name: "Enketiah Martinez", photo:"https://randomuser.me/api/portraits/men/79.jpg" , bio: "I am a Full Stack developer on Microsoft")
User.create(name: "Anthony Capozzo", photo:"https://randomuser.me/api/portraits/men/40.jpg" , bio: "I am a magician in las Vegas")
User.create(name: "Roraima Duque", photo:"https://randomuser.me/api/portraits/women/7.jpg" , bio: "I am looking for a job")
User.create(name: "Diogo Dalot", photo:"https://randomuser.me/api/portraits/men/66.jpg" , bio: "I like to sleep")
User.create(name: "Maria Contreras", photo:"https://randomuser.me/api/portraits/women/33.jpg" , bio: "I am studying medicine")
User.create(name: "Antuan Russo", photo:"https://randomuser.me/api/portraits/men/3.jpg" , bio: "I want to be a model")
User.create(name: "Georgina Ronaldo", photo:"https://randomuser.me/api/portraits/women/46.jpg" , bio: "I dont like to talk with people, I like dogs")

100.times do |post|
  Post.create(title: "#{post}-Post",
      text: "This is the post number #{post} first posts to populate the db from the seed file wiht development purposes",
      user_id: (rand(1..9)))
end

200.times do |comment|
  Comment.create(
      user_id: (rand(1..9)),
      post_id: (rand(1..100)),
      text: "I really like this post. This is the comment number #{comment} created from the seed file to populate the db" )
end

300.times do |like|
  Like.create(user_id: (rand(1..10)), post_id: (rand(1..100)))
end