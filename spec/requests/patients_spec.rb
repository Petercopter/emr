require 'rails_helper'

describe 'Patients' do
  let!(:patient) { create :patient }
  let!(:admission) { create :admission, patient: patient }

  describe 'GET index' do
    before { get patients_path }

    it { expect(response).to be_successful }
  end

  describe 'GET show' do
    before { get patient_path(patient) }

    it { expect(response).to be_successful }
  end
end
