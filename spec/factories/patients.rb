FactoryBot.define do
  factory :patient do
    first_name { "MyString" }
    middle_name { "MyString" }
    last_name { "MyString" }
    mr { "MyString" }
    dob { "2019-01-29 10:16:48" }
    gender { 1 }
    admission { nil }
  end
end
