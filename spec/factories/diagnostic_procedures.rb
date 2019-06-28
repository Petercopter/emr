FactoryBot.define do
  factory :diagnostic_procedure do
    description { 'an exploratory radiography' }
    moment { 'February 18, 2018 5:15pm'.to_datetime }
  end
end
