# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: "Garnacho Guedes", photo:"https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80" , bio: "I am a chef on California Hard Rock Hotel")
User.create(name: "Viktoria Plzen", photo:"https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80" , bio: "I am a Dancer in Cesars Palace")
User.create(name: "Enketiah Martinez", photo:"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80" , bio: "I am a Full Stack developer on Microsoft")
User.create(name: "Anthony Capozzo", photo:"https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80" , bio: "I am a magician in las Vegas")
User.create(name: "Roraima Duque", photo:"https://plus.unsplash.com/premium_photo-1664203068007-52240d0ca48f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80" , bio: "I am looking for a job")
User.create(name: "Diogo Dalot", photo:"https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80" , bio: "I like to sleep")
User.create(name: "Maria Contreras", photo:"https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" , bio: "I am studying medicine")
User.create(name: "Antonella Russo", photo:"https://images.unsplash.com/photo-1509967419530-da38b4704bc6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1495&q=80" , bio: "I want to be a model")
User.create(name: "Georgina Ronaldo", photo:"https://images.unsplash.com/photo-1597223557154-721c1cecc4b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80" , bio: "I dont like to talk with people, I like dogs")

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