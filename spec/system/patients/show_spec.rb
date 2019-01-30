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

  before { visit patient_path(patient) }

  it do
    expect(page).to have_selector('.facility-name', text: facility.name)
    expect(page).to have_selector('.patient-first-name', text: patient.first_name)
    expect(page).to have_selector('.patient-last-name', text: patient.last_name)
    expect(page).to have_selector('.patient-mr', text: patient.mr)
    expect(page).to have_selector('.summary', text: 'This 43 years old male was admitted to Blue Alps Ski Camp on February 18, 2018, at 5:07pm due to a fracture of upper end of the right tibia (S82.101). The observed symptoms on admission were limited bending of the joint, severe pain, and swelling. Upon asking about known allergies, the patient disclosed hypersensitivity to aspirin or NSAIDs and gluten intolerance. Upon asking about chronic conditions, the patient disclosed Asthma (J45). The patient was administered with Acetaminophen 500mg PO q4hr to relieve pain and Naproxen 500mg PO q6hr to relieve swelling.')
    expect(page).to have_selector('.summary', text: 'The staff performed an exploratory radiography at 5:15pm, revealing a closed fracture in the right tibia (S82.101A). Our team proceeded to temporary bracing the right leg to restrict the motion.')
  end
end
