require 'rails_helper'

describe 'GET #show' do
  let(:facility) { build :facility }
  let(:order_frequency_q4hr) { build :order_frequency, value: 'q4' }
  let(:order_frequency_q6hr) { build :order_frequency, value: 'q6' }
  let(:admission_diagnosis) do
    build :diagnosis,
           code: '82.101',
           coding_system: 'S',
           description: 'a fracture of upper end of the right tibia'
  end
  let(:admission_observation) { build :observation }
  let(:symptom_limited_bending) { build :symptom, description: 'limited bending of the joint' }
  let(:symptom_pain) { build :symptom, description: 'severe pain' }
  let(:symptom_swelling) { build :symptom, description: 'swelling' }
  let(:admission) do
    build :admission,
           diagnoses: [admission_diagnosis],
           observations: [admission_observation],
           symptoms: [symptom_limited_bending, symptom_pain, symptom_swelling]
  end
  let(:allergy_aspirin) { build :allergy, description: 'hypersensitivity to aspirin or NSAIDs' }
  let(:allergy_gluten) { build :allergy, description: 'gluten intolerance' }
  let(:diagnostic_procedure) { build :diagnostic_procedure }
  let(:medication_acetaminophen) do
    build :medication_order,
           dosage: '500mg',
           name: 'Acetaminophen',
           necessity: 'relieve pain',
           unit: 'mg',
           order_frequency: order_frequency_q4hr
  end
  let(:medication_naproxen) do
    build :medication_order,
           dosage: '500',
           name: 'Naproxen',
           necessity: 'relieve swelling',
           unit: 'mg',
           order_frequency: order_frequency_q6hr
  end
  let(:treatment) { build :treatment }
  let!(:patient) do
    create :patient,
           admission: admission,
           allergies: [allergy_aspirin, allergy_gluten],
           diagnostic_procedures: [diagnostic_procedure],
           medications: [medication_acetaminophen, medication_naproxen],
           treatments: [treatment]
  end

  let!(:diagnosis_asthma) { create :diagnosis, code: '45', coding_system: 'J', description: 'Asthma', diagnoseable: patient }
  let!(:diagnosis) { create :diagnosis, diagnoseable: patient }

  before {
    binding.pry
    get patient_path(patient) }

  it do
    expect(page).to have_selector('.facility-name', text: facility.name)
  end
end
