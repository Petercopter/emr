FactoryBot.define do
  factory :medication_order do
    name { "MyString" }
    unit { 1 }
    dosage { "9.99" }
    route { 1 }
    order_frequency { nil }
  end
end
