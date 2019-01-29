class Allergy < ApplicationRecord
  belongs_to :patient, inverse_of: :allergies

  validates :description,
            presence: true
end
