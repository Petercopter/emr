class Admission < ApplicationRecord
  belongs_to :patient, inverse_of: :admission

  has_many :diagnoses, as: :diagnoseable, inverse_of: :diagnoseable
  has_many :observations, inverse_of: :admission
  has_many :symptoms, inverse_of: :admission

  validates :moment, presence: true
end
