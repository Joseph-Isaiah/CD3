Hospital.destroy_all
User.destroy_all

puts "Creating Hospitals"

Hospital.create!(
  name: "Doctors Hospital",
  address: "5100 West Broad Street, Columbus, OH, 43228"
)

Hospital.create!(
  name: "Dublin Methodist Hospital",
  address: "7500 Hospital Drive, Dublin, OH, 43016"
)

Hospital.create!(
  name: "Grant Medical Center",
  address: "111 South Grant Avenue, Colombus, OH, 43215"
)

Hospital.create!(
  name: "Riverside Methodist Hospital",
  address: "3535 Olentangy River Road, Colombus, OH, 43214"
)

Hospital.create!(
  name: "Ohio State University Medical Center",
  address: "410 West 10th Avenue, Colombus, Ohio, 43210"
)

Hospital.create!(
  name: "Mount Carmel East",
  address: "6001 East Broad Street, Columbus, Ohio, 43213"
)

puts "Creating Paramedics"

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: 123456,
    name: Faker::Name.name,
    unit: Faker::Company.name
    )
end

puts "Creating Hospital Users"

hospitals_array = Hospital.all

hospitals_array.each do |hospital|
  User.create!( name: hospital.name, email: Faker::Internet.email, password: 123456, unit: Faker::Company.name, hospital: hospital )
end

puts "Creating Categories"

Category.create!(
  name: "Medical"
)
Category.create!(
  name: "Trauma"
)
Category.create!(
  name: "Pregnancy"
)
Category.create!(
  name: "Child"
)

puts "creating conditions"

puts "creating conditions for Medical"

Condition.create!(
  name: "Chest pain"
  category: Category.find_by(name: "Medical")
)


puts "creating conditions for Trauma"

Condition.create!(
  name: "Burn"
  category:
)

puts "creating conditions for Pregnancy"
puts "creating conditions for Child"

conditions_array = Condition.all

users_array = Condition.all

puts "creating calls"
