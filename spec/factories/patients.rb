FactoryBot.define do
  factory :patient do
    dob { 43.years.ago }
    first_name { 'Thomas' }
    gender { 'male' }
    last_name { 'Schudel' }
    mr { '30997' }

    facility
  end
end
