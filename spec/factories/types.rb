FactoryBot.define do
  factory :type do
    sequence(:name) { |n| "Type #{n}" }
  end
end
