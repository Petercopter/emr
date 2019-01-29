require 'rails_helper'

describe MedicationOrder do
  describe 'associations' do
    it do
      is_expected.to belong_to(:order_frequency).inverse_of(:medication_orders)
      is_expected.to belong_to(:patient).inverse_of(:medications)
    end
  end
end
