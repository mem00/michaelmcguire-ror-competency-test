# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.find_by_email("admin@articles.com").present?
  user = User.new
  user.email = "admin@articles.com"
  user.password = "123456"
  user.roles = "admin"
  user.save!
end


categories = [
  {name: "Business"},
  {name: "Pop Culture"},
  {name: "Sports"},
  {name: "Other"}
]
  

articles = [
  {
    title: "Is the market going up or down?",
    content: "Will the market go higher or lower? Who knows, but I would like to.",
    category: "Business"
  },
  {
   title: "A corp aquires B corp",
   content: "In a bold move, A corp buys B corp!",
   category: "Business"
  },
  {
    title: "C corp receives funding",
    content: "D capital invests in C corp as of yesterday",
    category: "Business"
  },
  {
    title: "E corp CEO retires",
    content: "CEO of E corp has retired after 10 years at the helm",
    category: "Business"
  },
  {
    title: "You shall not pass",
    content: "Gandalf tells Balrog that he shall not pass!",
    category: "Pop Culture"
  },
  {
    title: "Death Star explodes",
    content: "Luke has destroyed the Death Star",
    category: "Pop Culture"
  },
  {
    title: "Who is dating who?",
    content: "SoandSo was spotted with SoandSo at Nobu last night",
    category: "Pop Culture"
  },
  {
    title: "Drake announces new album",
    content: "Drake has set the release date of his new album",
    category: "Pop Culture"
  },
  {
    title: "Will the Jets win a game this year",
    content: "The Jets have yet to win a game! Will they?",
    category: "Sports"
  },
  {
    title: "Serena Williams - celebrating 25 years",
    content: "25 years ago, Serena Williams made her pro debut",
    category: "Sports"
  },
  {
    title: "Dodgers win the World Series",
    content: "The LA Dodgers have won the world series!",
    category: "Sports"
  },
  {
    title: "E corp CEO retires",
    content: "CEO of E corp has retired after 10 years at the helm",
    category: "Sports"
  }
]
  

categories.each do |category|
  category = Category.find_or_create_by(name: category[:name])
end

articles.each do |article|
  category = Category.find_by_name(article[:category])
  Article.find_or_create_by(title: article[:title], content: article[:content], category: category, user: user)
end