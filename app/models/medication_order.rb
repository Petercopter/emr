class MedicationOrder < ApplicationRecord
  belongs_to :order_frequency, inverse_of: :medication_orders
  belongs_to :patient, inverse_of: :medications

  enum route: %i[im po sc]
  enum unit: %i[mg]

  validates :dosage,
            :name,
            :necessity,
            :route,
            :unit,
            presence: true
end
