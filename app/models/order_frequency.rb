class OrderFrequency < ApplicationRecord
  has_many :medication_orders, inverse_of: :order_frequency

  enum unit: %i[hr]

  validates :unit,
            :value,
            presence: true
end
