# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

return if Rails.env.production?

user = User.create!(name: Faker::Name.name, email: 'eu@eu.br', password: '123456')

create_entry = lambda do
  Entry.new(
    title: Faker::Lorem.sentence(word_count: 5),
    subtitle: Faker::Lorem.sentence(word_count: 4),
    description: Faker::Lorem.sentence(word_count: 4),
    text: "<p>#{Faker::Lorem.paragraphs(number: 5, supplemental: true).join('</p><p>')}</p>",
    user: user
  )
end

Faker::Number.within(range: 13..23).times do
  entry = create_entry.call
  entry.entryable = Portfolio.new(
    company_name: Faker::Company.name,
    designed_at: Faker::Date.between(from: 2.years.ago, to: Date.today),
    contract_type: Portfolio.contract_types.keys.sample
  )
  entry.save!
end

Faker::Number.within(range: 13..23).times do
  entry = create_entry.call
  entry.entryable = Blog.new
  entry.save!
end
