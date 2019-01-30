require 'rails_helper'

describe 'Home' do
  describe 'GET #index' do
    let!(:patient) { create :patient }

    before { visit root_path }

    it do
      expect(page).to have_selector('a', class: 'navbar-brand', text: 'EMR Prototype')
      expect(page).to have_selector('a', text: [patient.first_name, patient.middle_name, patient.last_name].compact.join(' '))
    end
  end
end
