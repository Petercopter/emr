class Observation < ApplicationRecord
  belongs_to :admission, inverse_of: :observations

  validates :description,
            :moment,
            presence: true
end
