FactoryBot.define do
  factory :blog do; end

  trait :reviewed do
    reviewed_by { association :user }
    reviewed_at { DateTime.now }
  end
end
