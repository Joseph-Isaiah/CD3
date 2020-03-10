Call.destroy_all
Condition.destroy_all
Category.destroy_all
User.destroy_all
Hospital.destroy_all

puts "Creating Hospitals"

h1 = Hospital.create!(
  name: "Doctors Hospital",
  address: "5100 West Broad Street, Columbus, OH, 43228"
)
h1.photo.attach(io: File.open('fixtures/doctors-hospital.jpeg'), filename: 'doctors-hospital.jpeg')

h2 = Hospital.create!(
  name: "Dublin Methodist Hospital",
  address: "7500 Hospital Drive, Dublin, OH, 43016"
)
h2.photo.attach(io: File.open('fixtures/dublin-methodist-hospital.jpg'), filename: 'dublin-methodist-hospital.jpg')

h3 = Hospital.create!(
  name: "Grant Medical Center",
  address: "111 South Grant Avenue, Colombus, OH, 43215"
)
h3.photo.attach(io: File.open('fixtures/grant-hospital.jpg'), filename: 'grant-hospital.jpg')

h4 = Hospital.create!(
  name: "Riverside Methodist Hospital",
  address: "3535 Olentangy River Road, Colombus, OH, 43214"
)
h4.photo.attach(io: File.open('fixtures/riverside-methodist.jpg'), filename: 'riverside-methodist.jpg')

h5 = Hospital.create!(
  name: "Ohio State University Medical Center",
  address: "410 West 10th Avenue, Colombus, Ohio, 43210"
)
h5.photo.attach(io: File.open('fixtures/university-hospital.jpg'), filename: 'university-hospital.jpg')

h6 = Hospital.create!(
  name: "Mount Carmel East",
  address: "6001 East Broad Street, Columbus, Ohio, 43213"
)
h6.photo.attach(io: File.open('fixtures/mount-carmel-east.jpg'), filename: 'mount-carmel-east.jpg')


puts "Creating Paramedics"

5.times do |n|
  User.create!(
    email: "paramedic#{n + 1}@user.com",
    password: 123456,
    name: Faker::Name.name,
    unit: Faker::Company.name
    )
end

puts "Creating Hospital Users"

hospitals_array = Hospital.all

hospitals_array.each_with_index do |hospital, index|
  User.create!( name: hospital.name, email: "hospital#{index + 1}@user.com", password: 123456, unit: Faker::Company.name, hospital: hospital )
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
  name: "Chest pain",
  category: Category.find_by(name: "Medical"),
  fields: {
    # values checked
    time_of_onset: { type: "string" },
    timing: { type: "timing_options", values: %w[sudden gradual] },
    severity: { type: "0-10_range" },
    chest_pain_quality: { type: "quality_options", values: ["Like Prior MI", "Squeezing", "Stabbing", "Burning", "Aching"] },
    onset: { type: "onset_options", values: %w[sleep rest upset exertion] },
    radiation: { type: "body_part_radiation", values: ["None", "Arm", "Shoulder", "Back", "Jaw"] },
    chest_pain_associated_symptoms: { type: "associated_symptoms", values: [ "None", "Nausea", "Sweating", "SOB", "Dizziness", "Weakness", "Cough", "Palpitations"] },
    chest_pain_past_history: { type: "past_history_options", values: ["Cardiac", "Diabetes", "PE", "Other"] },
    chest_pain_meds: { type: "meds_options_chest_pain", values: ["O2", "Aspirin", "Nitro", "IV Fluids", "Other"] },
    chest_pain_worsened_by: { type: "chest_pain_worsened_by_options", values: ["Nothing", "Breathing", "Activity", "Position"] },
    chest_pain_relieved_by: { type: "relieved_by_options", values: ["None", "Rest", "Nitro", "Other"] },
    current_condition: { type: "current_condition_options"},
    STEMI: { type: "boolean", values: ["Yes", "No"] },
    # values not yet checked

  }
)

Condition.create!(
  name: "Cardiac Arrest",
  category: Category.find_by(name: "Medical")
)

Condition.create!(
  name: "Shortness of Breath",
  category: Category.find_by(name: "Medical")
)

Condition.create!(
  name: "Abdominal Pain",
  category: Category.find_by(name: "Medical")
)

Condition.create!(
  name: "Neuro",
  category: Category.find_by(name: "Medical")
)

Condition.create!(
  name: "Unresponsive",
  category: Category.find_by(name: "Medical")
)

Condition.create!(
  name: "Drowning",
  category: Category.find_by(name: "Medical")
)

Condition.create!(
  name: "Bleeding",
  category: Category.find_by(name: "Medical")
)

Condition.create!(
  name: "Other",
  category: Category.find_by(name: "Medical")
)

puts "creating conditions for Trauma"

Condition.create!(
  name: "Burn",
  category: Category.find_by(name: "Trauma"),
  fields: {
    time_of_onset: { type: "string" },
    burn_context: { type: "burn_context_options", values: ["Flame", "Liquid", "Steam", "Chemical", "Electrical"] },
    burn_smoke_inhalation: { type: "smoke_inhalation_options", values: ["None", "Brief", "Prolonged"] },
    breathing_difficulty: { type: "boolean", values: ["Yes", "No"] },
    burn_closed_space: { type: "boolean", values: ["Yes", "No"] },
    burn_facial: { type: "burn_facial_involvement_options", values: [ "None", "Mouth", "Lips", "Eyes", "Nares", "Ears"] },
    burn_location: { type: "burn_body_part", values: ["Head", "Face", "Neck", "Torso", "Upper Extremeties", "Lower Extremeties", "Groin", "Hands", "Feet"] },
    burn_degree: { type: "burn_degree", values: ["1st", "2nd", "3rd", "Multiple"] },
    burn_percentage: { type: "integer" },
    burn_meds: { type: "meds_options_burn", values: ["O2", "IV fluids", "Pain Meds", "Other"] },
  }
)

Condition.create!(
  name: "MVC",
  category: Category.find_by(name: "Trauma")
)

Condition.create!(
  name: "Fall",
  category: Category.find_by(name: "Trauma")
)

Condition.create!(
  name: "GSW",
  category: Category.find_by(name: "Trauma")
)

Condition.create!(
  name: "Laceration",
  category: Category.find_by(name: "Trauma")
)

Condition.create!(
  name: "Other",
  category: Category.find_by(name: "Trauma")
)

puts "creating conditions for Pregnancy"

Condition.create!(
  name: "Labor",
  category: Category.find_by(name: "Pregnancy")
)

Condition.create!(
  name: "Bleeding",
  category: Category.find_by(name: "Pregnancy")
)

Condition.create!(
  name: "Pain",
  category: Category.find_by(name: "Pregnancy")
)

Condition.create!(
  name: "Other",
  category: Category.find_by(name: "Pregnancy")
)

puts "creating conditions for Child"

Condition.create!(
  name: "Respiratory",
  category: Category.find_by(name: "Child")
)

Condition.create!(
  name: "Fever",
  category: Category.find_by(name: "Child")
)

Condition.create!(
  name: "Abdominal Pain",
  category: Category.find_by(name: "Child")
)

Condition.create!(
  name: "Unresponsive",
  category: Category.find_by(name: "Child")
)

Condition.create!(
  name: "Drowning",
  category: Category.find_by(name: "Child")
)

Condition.create!(
  name: "Other",
  category: Category.find_by(name: "Child")
)
conditions_array = Condition.all

users_array = User.where(hospital_id: nil)

puts "creating calls"


# for testing hospital view:

12.times do
  Call.create!(
     gender: 'male',
     age: rand(99),
     blood_pressure: 'High' ,
     pulse: 80,
     temperature: 70.8,
     spa02: 9.00,
     user: User.all.sample,
     hospital: Hospital.all.sample,
     details: {},
     condition: Condition.all.sample,
    )
end

gender_array = ["female", "male"]

