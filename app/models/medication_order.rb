class MedicationOrder < ApplicationRecord
  belongs_to :order_frequency, inverse_of: :medication_orders
  belongs_to :patient, inverse_of: :medications

  enum route: %i[:po :im :sc]
  enum unit: %i[:mg]

  validates :dosage,
            :name,
            :route,
            :unit,
            presence: true
end
