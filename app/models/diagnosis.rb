class Diagnosis < ApplicationRecord
  belongs_to :diagnoseable, inverse_of: :diagnoses, polymorphic: true

  validates :code,
            :coding_system,
            :description,
            presence: true
end
