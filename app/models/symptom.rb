class Symptom < ApplicationRecord
  belongs_to :admission, inverse_of: :symptoms

  validates :description, presence: true
end
