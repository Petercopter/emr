require 'rails_helper'

describe Patient do
  describe 'associations' do
    it do
      is_expected.to belong_to(:facility).inverse_of(:patients)

      is_expected.to have_one(:admission).inverse_of(:patient)

      is_expected.to have_many(:allergies).inverse_of(:patient)
      is_expected.to have_many(:chronic_conditions).class_name('Diagnosis')
      is_expected.to have_many(:diagnoses).class_name('Diagnosis')
      is_expected.to have_many(:diagnostic_procedures).inverse_of(:patient)
      is_expected.to have_many(:medications).inverse_of(:patient).class_name('MedicationOrder')
      is_expected.to have_many(:treatments).inverse_of(:patient)
    end
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of :dob
      is_expected.to validate_presence_of :first_name
      is_expected.to validate_presence_of :gender
      is_expected.to validate_presence_of :last_name
      is_expected.to validate_presence_of :mr
    end
  end
end
