# Create sample rooms
room_names = [
  "General",
  "Random",
  "Fun & Games",
  "Book Club"
]

room_names.each do |name|
  Room.find_or_create_by!(name: name)
end

puts "Created #{Room.count} rooms"

User.create(name: "John", surname: "Doe", email: "john@doe.com", password: "123456")
User.create(name: "Leo", surname: "Messi", email: "leo@messi.com", password: "123456")

puts "Created #{User.count} users"
