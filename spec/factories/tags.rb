FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "Tag #{n}" }
    association :series
  end
end
