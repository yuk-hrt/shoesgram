FactoryBot.define do
  factory :shoe do
    text {"hello!"}
    title {"hoge!"}
    brand {"hoge"}
    image {"hoge.png"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end