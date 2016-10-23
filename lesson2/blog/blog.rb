require_relative 'post'
require_relative 'user'
require_relative 'like'

user1 = User.new(first_name: 'Eugene', last_name: 'Mikhasenko', age: 21)
user2 = User.new(first_name: 'John', age: 30, last_name: 'Ferris')
User.show_all

post1 = Post.new(content: 'New film was so cool!', author: user1)
post2 = Post.new(content: 'I\'m learning ruby!', author: user2)
Post.show_all
post1.edit_author! user2
post2.edit_content! 'I\'m learning HTML and CSS!'
Post.show_all
post1.like user1
post2.like user1
post2.like user2
Post.show_all
post2.show_likes
puts
user1.show_likes
post1.delete!
Post.show_all
