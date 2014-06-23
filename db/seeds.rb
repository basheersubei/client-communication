# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create( 
  [ 
    { name: 'FirstClient', url_hash: '90e26ff0d8731959fe913dc2952880ce' },
  ]
)

first_client = User.find_by(name: 'FirstClient')


posts = Post.create(
	[
		{ title: 'Teh First Post', content: 'Lorem something something?', user_id: first_client.id },
		{ title: 'The secund post', content: 'Any suggestions?', user_id: first_client.id }
	]
)

comments = Comment.create(
	[
		{ post_id: 1, content: 'Lorem ipsum, you dumbass!' },
		{ post_id: 2, content: 'Take a fu**ing english class, you dumbass!' }
	]
)