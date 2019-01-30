require 'rails_helper'

describe 'Home' do
  describe 'GET #index' do
    let(:patient) { create :patient }

    before { visit patient_path(patient) }

    it do
      expect(page).to have_selector('a', class: 'navbar-brand', text: 'EMR Prototype')
      expect(page).to have_selector('a', text: [patient.first_name, patient.middle_name, patient.last_name].join(' '))
    end
  end

  describe 'GET #show' do
    let(:facility) { create :facility }
    let(:order_frequency_q4hr) { create :order_frequency, value: 'q4' }
    let(:order_frequency_q6hr) { create :order_frequency, value: 'q6' }
    let(:allergy_aspirin) { create :allergy, description: 'hypersensitivity to aspirin or NSAIDs' }
    let!(:allergy_gluten) { create :allergy, description: 'gluten intolerance' }
    let!(:diagnosis_asthma) { create :diagnosis, code: '45', coding_system: 'J', description: 'Asthma' }
    let(:diagnosis) { create :diagnosis }
    let(:diagnostic_procedure) { create :diagnostic_procedure }
    let(:medication_acetaminophen) do
      create :medication_order,
             dosage: '500mg',
             name: 'Acetaminophen',
             necessity: 'relieve pain',
             unit: 'mg',
             order_frequency: order_frequency_q4hr
    end
    let(:medication_naproxen) do
      create :medication_order,
             dosage: '500',
             name: 'Naproxen',
             necessity: 'relieve swelling',
             unit: 'mg',
             order_frequency: order_frequency_q6hr
    end
    let(:treatment) { create :treatment }
    let(:patient) do
      create :patient,
             admission: admission,
             allergies: [allergy_aspirin, allergy_gluten],
             chronic_conditions: [diagnosis_asthma],
             diagnoses: [diagnosis],
             diagnostic_procedures: [diagnostic_procedure],
             medications: [medication_acetaminophen, medication_naproxen],
             treatments: [treatment]
    end
    let(:admission_diagnosis) do
      create :diagnosis,
             code: '82.101',
             coding_system: 'S',
             description: 'a fracture of upper end of the right tibia'
    end
    let(:admission_observation) { create :observation }
    let(:symptom_limited_bending) { create :symptom, description: 'limited bending of the joint' }
    let(:symptom_pain) { create :symptom, description: 'severe pain' }
    let(:symptom_swelling) { create :symptom, description: 'swelling' }
    let(:admission) do
      create :admission,
             diagnoses: [admission_diagnosis],
             observations: [admission_observation],
             patient: patient,
             symptoms: [symptom_limited_bending, symptom_pain, symptom_swelling]
    end

    before { get patient_path(patient) }

    it do
      binding.pry
      expect(page).to have_selector('.facility-name', text: facility.name)
    end
  end
end
