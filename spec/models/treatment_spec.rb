require 'rails_helper'

describe Treatment do
  describe 'associations' do
    it { is_expected.to belong_to(:patient).inverse_of(:treatments) }
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of :description
      is_expected.to validate_presence_of :necessity
    end
  end
end
