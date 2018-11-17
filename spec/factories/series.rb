FactoryBot.define do
  factory :series do
    sequence(:name) { |n| "Serie #{n}" }
    description { "A test series" }
    release_date { Date.today }
    association :category
    association :type
  end
end
