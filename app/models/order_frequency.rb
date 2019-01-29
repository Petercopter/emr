class OrderFrequency < ApplicationRecord
  has_many :medication_orders, inverse_of: :order_frequency
end
