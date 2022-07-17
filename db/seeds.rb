# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {
    username: 'user_one',
    password: 'P@ssw0rd!',
    bio: 'Here is a ream of text that represents my bio.',
    avatar_url: 'http://www.fillmurray.com/200/300'
  },
  {
    username: 'user_two',
    password: 'P@ssw0rd!',
    bio: 'Here is some more text that represents my bio.',
    avatar_url: 'http://www.fillmurray.com/300/400'
  }
])

posts = Post.create([
  {
    title: 'The First Post',
    body: 'This is the first post. This post is amazing. Isn\'t it?',
    user_id: 1
  },
  {
    title: 'The Second Post',
    body: 'Second. Post. Same as the first.',
    user_id: 1
  },
  {
    title: 'The Third Post',
    body: 'This is the third post. This getting annoying, isn\'t it?',
    user_id: 2
  },
  {
    title: 'The Fouth Post',
    body: 'Last one, I swear.',
    user_id: 2
  },
])

posts.each do |post|
  post.image.attach(io: File.open('./public/murray.jpg'), filename: 'murray.jpg')
end
