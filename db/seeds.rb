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
    time_of_onset: { type: "time_ago" },
    timing: { type: "radio", values: %w[Sudden Gradual] },
    severity: { type: "0-10_range" },
    chest_pain_quality: { type: "checkbox", values: ["Like Prior MI", "Squeezing", "Stabbing", "Burning", "Aching"] },
    onset: { type: "radio", values: %w[Sleep Rest Upset Exertion] },
    radiating: { type: "checkbox", values: ["None", "Arm", "Shoulder", "Back", "Jaw"] },
    chest_pain_associated_symptoms: { type: "checkbox", values: [ "None", "Nausea", "Sweating", "SOB", "Dizziness", "Weakness", "Cough", "Palpitations"] },
    chest_pain_past_history: { type: "checkbox", values: ["Cardiac", "Diabetes", "PE", "Other"] },
    chest_pain_meds: { type: "checkbox", values: ["O2", "Aspirin", "Nitro", "IV Fluids", "Other"] },
    chest_pain_worsened_by: { type: "checkbox", values: ["Nothing", "Breathing", "Activity", "Position"] },
    chest_pain_relieved_by: { type: "checkbox", values: ["None", "Rest", "Nitro", "Other"] },
    current_condition: { type: "radio", values: ["Still Present", "Better", "Worse", "Gone"] },
    STEMI: { type: "boolean", values: ["Yes", "No"] },
  }
)

Condition.create!(
  name: "COVID-19",
  category: Category.find_by(name: "Medical"),
  fields: {
    confirmed: { type: "boolean", values: %w[Yes No] },
    PPE_in_place: { type: "boolean", values: %w[Yes No] },
    GCS: { type: "checkbox", values: ["0-3", "4-6", "7-9", "10-12", "13-15"] },
    respiratory_distress: { type: "boolean", values: %w[Yes No] },
    date_of_onset: { type: "time_ago" },
    current_condition: { type: "radio", values: ["Still Present", "Better", "Worse", "Gone"] },
  }
)

Condition.create!(
  name: "Cardiac Arrest",
  category: Category.find_by(name: "Medical"),
  fields: {
    time_of_onset: { type: "time_ago" },
    CPR_in_progress: { type: "boolean", values: ["Yes", "No"] },
    witnessed_arrest: { type: "boolean", values: %w[Yes No] },
    CPR_initiated_prior_to_EMS: { type: "boolean", values: ["Yes", "No"] },
    airway: { type: "checkbox", values: ["O2", "BVM", "Intubated", "Other"] },
    defibrillated: { type: "boolean", values: %w[Yes No] },
    medication_given: { type: "checkbox", values: ["None", "Epi", "Atropine", "Adenosine", "Amiodarone", "Lidocaine", "Magnesium", "NARCAN"] },
    current_rythm: { type: "checkbox", values: [ "NA", "VF/Pulseless VT", "PEA", "Asystole", "Other"] },
  }
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

puts "creating conditions for Trauma"

Condition.create!(
  name: "Burn",
  category: Category.find_by(name: "Trauma"),
  fields: {
    time_of_onset: { type: "time_ago" },
    burn_context: { type: "radio", values: ["Flame", "Liquid", "Steam", "Chemical", "Electrical"] },
    burn_smoke_inhalation: { type: "radio", values: ["None", "Brief", "Prolonged"] },
    breathing_difficulty: { type: "boolean", values: ["Yes", "No"] },
    burn_closed_space: { type: "boolean", values: ["Yes", "No"] },
    burn_facial: { type: "checkbox", values: [ "None", "Mouth", "Lips", "Eyes", "Nares", "Ears"] },
    burn_location: { type: "checkbox", values: ["Head", "Face", "Neck", "Torso", "Upper Extremeties", "Lower Extremeties", "Groin", "Hands", "Feet"] },
    burn_degree: { type: "radio", values: ["1st", "2nd", "3rd", "Multiple"] },
    burn_percentage: { type: "percentage" },
    burn_meds: { type: "checkbox", values: ["O2", "IV fluids", "Pain Meds", "Other"] },
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

hospital_array_without_hospital_1 = Hospital.all.drop(1)
# for testing hospital view:

Call.create!(
    gender: 'male',
    age: rand(99),
    blood_pressure: 'High' ,
    pulse: 80,
    temperature: 70.8,
    spa02: 9.00,
    user: User.all.sample,
    hospital: Hospital.first,
    details: {},
    condition: Condition.find_by(name: "Neuro")
)

Call.create!(
    gender: 'male',
    age: rand(99),
    blood_pressure: 'High' ,
    pulse: 80,
    temperature: 70.8,
    spa02: 9.00,
    user: User.all.sample,
    hospital: Hospital.first,
    details: {},
    condition: Condition.find_by(name: "MVC")
)

Call.create!(
    gender: 'male',
    age: rand(99),
    blood_pressure: 'High' ,
    pulse: 80,
    temperature: 70.8,
    spa02: 9.00,
    user: User.all.sample,
    hospital: Hospital.first,
    details: {},
    condition: Condition.find_by(name: "Labor")
)

Call.create!(
    gender: 'male',
    age: rand(99),
    blood_pressure: 'High' ,
    pulse: 80,
    temperature: 70.8,
    spa02: 9.00,
    user: User.all.sample,
    hospital: Hospital.first,
    details: {},
    condition: Condition.find_by(name: "Fever")
)

12.times do
  Call.create!(
     gender: 'male',
     age: rand(99),
     blood_pressure: 'High' ,
     pulse: 80,
     temperature: 70.8,
     spa02: 9.00,
     user: User.all.sample,
     hospital: hospital_array_without_hospital_1.sample,
     details: {},
     condition: Condition.all.sample,
    )
end

gender_array = ["Female", "Male"]

