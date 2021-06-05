FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence(word_count: rand(3..10)) }
    body { Faker::Lorem.paragraph(sentence_count: rand(3..15)) }
    author {Faker::Name.name }
    user_id { Faker::Number.non_zero_digit }
  end
end
