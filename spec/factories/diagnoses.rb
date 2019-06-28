FactoryBot.define do
  factory :diagnosis do
    coding_system { 'S' }
    code { '82.101A' }
    description { 'a closed fracture in the right tibia' }
  end
end
