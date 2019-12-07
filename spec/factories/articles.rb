FactoryBot.define do
  factory :article do
    title {"hello!"}
    content {"hello!"}
    # image {"hoge.png"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end