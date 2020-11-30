FactoryBot.define do
  factory :shoe do
    # text {Faker::Lorem.sentence}
    text {"hello!"}
    title {"hoge!"}
    brand {"hoge"}
    # image {"hoge.png"}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end