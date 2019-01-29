require 'rails_helper'

describe Admission do
  describe 'associations' do
    it do
      is_expected.to belong_to(:patient).inverse_of(:admission)

      is_expected.to have_many(:diagnoses).inverse_of(:diagnoseable)
      is_expected.to have_many(:observations).inverse_of(:admission)
      is_expected.to have_many(:symptoms).inverse_of(:admission)
    end
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of :moment
    end
  end
end
