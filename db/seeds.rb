require 'faker'
 

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.save!
end
users = User.all

 # Create Bookmarks and Topics
 25.times do
   Bookmark.create!(
     address:   Faker::Internet.url,
     topic:     Faker::Lorem.word
  )
 end
 bookmarks = Bookmark.all

 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld',
 )
 member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Bookmark.count} bookmarks created"