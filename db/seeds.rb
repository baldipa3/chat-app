# Create sample rooms
room_names = [
  "General",
  "Random",
  "Fun & Games",
  "Book Club",
]

room_names.each do |name|
  Room.find_or_create_by!(name: name)
end

puts "Created #{Room.count} rooms"
