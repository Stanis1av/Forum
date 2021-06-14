FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph(sentence_count: rand(1..5)) }
    author {Faker::Name.name }
    user_id { Faker::Number.non_zero_digit }
    article_id { nil } # {Faker::Number.between(from: (Article.first.id), to: (Article.last.id))}
  end
end
