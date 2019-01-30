FactoryBot.define do
  factory :medication_order do
    dosage { '500mg' }
    name { 'Acetaminophen' }
    necessity { 'relieve pain' }
    route { 'po' }
    unit { 'mg' }

    order_frequency
  end
end
