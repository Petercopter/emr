# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


facility = Facility.find_or_create_by(name: 'Blue Alps Ski Camp')
order_frequency_q4hr = OrderFrequency.find_or_create_by(unit: 'hr', value: 'q4')
order_frequency_q6hr = OrderFrequency.find_or_create_by(unit: 'hr', value: 'q6')

patient = facility.patients.find_or_create_by(
  first_name: 'Thomas',
  gender: 'male',
  dob: 43.years.ago,
  last_name: 'Schudel',
  mr: '30997'
)

patient.allergies.find_or_create_by(description: 'hypersensitivity to aspirin or NSAIDs')
patient.allergies.find_or_create_by(description: 'gluten intolerance')

patient.chronic_conditions.find_or_create_by(
  code: '45',
  coding_system: 'J',
  description: 'Asthma'
)

patient.medications.find_or_create_by(
  dosage: '500mg',
  name: 'Acetaminophen',
  route: 'po',
  unit: 'mg',
  order_frequency: order_frequency_q4hr
)

patient.medications.find_or_create_by(
  dosage: '500',
  name: 'Naproxen',
  route: 'po',
  unit: 'mg',
  order_frequency: order_frequency_q6hr
)

admission = Admission.find_or_create_by(moment: 1.month.ago, patient: patient)

admission.diagnoses.find_or_create_by(
  coding_system: 'S',
  code: '82.101',
  description: 'a fracture of upper end of the right tibia'
)

admission.observations.find_or_create_by(description: 'No soft tissues were damaged')

admission.symptoms.find_or_create_by(description: 'severe pain')
admission.symptoms.find_or_create_by(description: 'swelling')
admission.symptoms.find_or_create_by(description: 'limited bending of the joint')
