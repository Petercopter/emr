require 'rails_helper'

describe DiagnosticProcedure do
  describe 'associations' do
    it { is_expected.to belong_to(:patient).inverse_of(:diagnostic_procedures) }
  end

  describe 'validations' do
    it do
      is_expected.to validate_presence_of :description
      is_expected.to validate_presence_of :moment
    end
  end
end
