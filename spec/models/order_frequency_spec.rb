require 'rails_helper'

describe OrderFrequency do
  describe 'associations' do
    it { is_expected.to have_many(:medication_orders).inverse_of(:order_frequency) }
  end
end
