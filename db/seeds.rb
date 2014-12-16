require 'faker'
 

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Topics
 15.times do
   Topic.create!(
     name:     Faker::Lorem.word
    )
 end
 topics = Topic.all

 # Create Bookmarks
 25.times do
   Bookmark.create!(
     address:   Faker::Internet.url
  )
 end
 bookmarks = Bookmark.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"