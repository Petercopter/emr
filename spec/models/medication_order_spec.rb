require 'rails_helper'

describe MedicationOrder do
  describe 'associations' do
    it do
      is_expected.to belong_to(:order_frequency).inverse_of(:medication_orders)
      is_expected.to belong_to(:patient).inverse_of(:medications)
    end
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of :dosage
      is_expected.to validate_presence_of :name
      is_expected.to validate_presence_of :necessity
      is_expected.to validate_presence_of :route
      is_expected.to validate_presence_of :unit
    end
  end
end
