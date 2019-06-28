require 'rails_helper'

describe Facility do
  describe 'associations' do
    it { is_expected.to have_many(:patients).inverse_of(:facility) }
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of :name
      is_expected.to validate_uniqueness_of(:name).case_insensitive
    end
  end
end
