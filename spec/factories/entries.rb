FactoryBot.define do
  factory :entry do
    user { association :user }
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph_by_chars(number: 1_000) }

    trait :seo do
      subtitle { Faker::Lorem.paragraph_by_chars(number: 70) }
      description { Faker::Lorem.paragraph_by_chars(number: 120) }
    end
  end

  factory :entry_with_seo, traits: [ :seo ]
end
