Client.destroy_all
puts "Creating clients..."

6.times do
  Client.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end

puts "Clients have been created!"
