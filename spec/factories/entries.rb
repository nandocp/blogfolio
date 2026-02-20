FactoryBot.define do
  factory :entry do
    user { association :user }
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph_by_chars(number: 1_000) }
    subtitle { Faker::Lorem.paragraph_by_chars(number: 70) }
    description { Faker::Lorem.paragraph_by_chars(number: 120) }

    factory :blog_entry do
      entryable { association :blog }
    end

    factory :portfolio_entry do
      entryable { association :portfolio }
    end
  end
end
