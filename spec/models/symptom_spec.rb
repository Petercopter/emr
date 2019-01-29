require 'rails_helper'

describe Symptom do
  describe 'associations' do
    it { is_expected.to belong_to(:admission).inverse_of(:symptoms) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :description }
  end
end
