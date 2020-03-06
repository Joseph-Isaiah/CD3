require "pry-byebug"
Call.destroy_all
Condition.destroy_all
Category.destroy_all
User.destroy_all
Hospital.destroy_all


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
    onset: { type: "onset_options", values: %w[sleep rest upset exertion] },
    timing: { type: "timing_options", values: %w[sudden gradual] },
    radiation: { type: "body_part_radiation", values: ["None", "Arm", "Shoulder", "Back", "Jaw"] },
    chest_pain_quality: { type: "quality_options", values: ["Like Prior MI", "Squeezing", "Stabbing", "Burning", "Aching"] },
    chest_pain_meds: { type: "meds_options_chest_pain", values: ["O2", "Aspirin", "Nitro", "IV Fluids", "Other"] },
    chest_pain_associated_symptoms: { type: "associated_symptoms", values: ["Nausea", "Sweating", "SOB", "Dizziness", "Weakness", "Cough", "Palpitations"] },
    chest_pain_past_history: { type: "past_history_options", values: ["Cardiac", "Diabetes", "PE", "Other"] },
    chest_pain_worsened_by: { type: "chest_pain_worsened_by_options", values: ["Nothing", "Breathing", "Activity", "Position"] },
    chest_pain_relieved_by: { type: "relieved_by_options", values: ["None", "Rest", "Nitro", "Other"] },
    STEMI: { type: "boolean", values: ["Yes", "No"] },
    time_of_onset: { type: "string" },
    current_condition: { type: "current_condition_options"},
    severity: { type: "0-10_range" },
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
    burn_smoke_inhalation: { type: "smoke_inhalation_options", values: ["None", "Brief", "Prolonged"] },
    breathing_difficulty: { type: "boolean", values: ["Yes", "No"] },
    burn_context: { type: "burn_context_options", values: ["Flame", "Liquid", "Steam", "Chemical", "Electrical"] },
    burn_closed_space: { type: "boolean", values: ["Yes", "No"] },
    burn_facial: { type: "burn_facial_involvement_options", values: ["Mouth", "Lips", "Eyes", "Nares", "Ears"] },
    burn_location: { type: "burn_body_part", values: ["Head", "Face", "Neck", "Torso", "Upper Extremeties", "Lower Extremeties", "Groin", "Hands", "Feet"] },
    burn_degree: { type: "burn_degree", values: ["1st", "2nd", "3rd", "Other"] },
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

gender_array = ["female", "male"]

