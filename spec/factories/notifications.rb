FactoryBot.define do
  factory :notification do
    account { nil }
    form { nil }
    body { "MyText" }
  end
end
