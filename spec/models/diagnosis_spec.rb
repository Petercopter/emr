require 'rails_helper'

describe Diagnosis do
  describe 'associations' do
    it do
      is_expected.to belong_to(:diagnoseable).inverse_of(:diagnoses)
    end
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of :code
      is_expected.to validate_presence_of :coding_system
      is_expected.to validate_presence_of :description
    end
  end
end
