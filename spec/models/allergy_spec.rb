require 'rails_helper'

describe Allergy do
  describe 'associations' do
    it { is_expected.to belong_to(:patient).inverse_of(:allergies) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :description }
  end
end
