class Treatment < ApplicationRecord
  belongs_to :patient, inverse_of: :treatments

  validates :description,
            :necessity,
            presence: true
end
