require 'rails_helper'

describe Observation do
  describe 'associations' do
    it { is_expected.to belong_to(:admission).inverse_of(:observations) }
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of :description
      is_expected.to validate_presence_of :moment
    end
  end
end
