class Patient < ApplicationRecord
  belongs_to :facility, inverse_of: :patients

  has_one :admission, inverse_of: :patient

  has_many :allergies, inverse_of: :patient
  has_many :diagnoses, as: :diagnoseable
  has_many :diagnostic_procedures, inverse_of: :patient
  has_many :diagnoses, inverse_of: :patient
  has_many :medications, inverse_of: :patient, class_name: 'MedicationOrder'
  has_many :treatments, inverse_of: :patient

  enum gender: %i[female male other]

  validates :dob,
            :first_name,
            :gender,
            :last_name,
            :middle_name,
            :mr,
            presence: true
end
