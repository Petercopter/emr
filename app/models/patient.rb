class Patient < ApplicationRecord
  belongs_to :facility, inverse_of: :patients

  has_one :admission, inverse_of: :patient

  has_many :allergies, inverse_of: :patient
  has_many :chronic_conditions, -> { where(coding_system: 'J') }, as: :diagnoseable, class_name: 'Diagnosis'
  has_many :diagnoses, -> { where(coding_system: 'S') }, as: :diagnoseable
  has_many :diagnostic_procedures, inverse_of: :patient
  has_many :medications, inverse_of: :patient, class_name: 'MedicationOrder'
  has_many :treatments, inverse_of: :patient

  enum gender: %i[female male other]

  validates :dob,
            :first_name,
            :gender,
            :last_name,
            :mr,
            presence: true

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - (now.month > dob.month || now.month == dob.month && now.day >= dob.day ? 0 : 1)
  end
end
