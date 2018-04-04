# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

html_tags = %w[h1 h2 h3 a]
html_tags.each do |tag|
  tag = HtmlTag.new(name: tag)

  if tag.save
    puts "Created ''#{tag.name}' html tag"
  else
    puts tag.errors.full_messages
  end
end
