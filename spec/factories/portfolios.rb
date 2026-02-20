FactoryBot.define do
  factory :portfolio do
    designed_at { Faker::Date.between(from: 2.years.ago, to: Date.today) }
    company_name { Faker::Company.name }
    contract_type { Portfolio.contract_types.keys.sample }
  end
end
