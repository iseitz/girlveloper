FactoryBot.define do
  factory :enrollment do
    course { nil }
    user { nil }
    rating { 1 }
    review { "MyText" }
    price { 1 }
  end
end
