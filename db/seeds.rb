# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create( 
  [ 
    { name: 'Admin' },
    { name: 'FirstClient' },
  ]
)

posts = Post.create(
	[
		{ title: 'Teh First Post', content: 'Lorem something something?'},
		{ title: 'The secund post', content: 'Any suggestions?'}
	]
)

first_client = User.find_by(name: 'FirstClient')

comments = Comment.create(
	[
		{ post_id: 1, content: 'Lorem ipsum, you dumbass!', user_id: first_client.id },
		{ post_id: 2, content: 'Take a fu**ing english class, you dumbass!', user_id: first_client.id }
	]
)