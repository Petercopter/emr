class MedicationOrder < ApplicationRecord
  belongs_to :order_frequency, inverse_of: :medication_orders
  belongs_to :patient, inverse_of: :medications
end
