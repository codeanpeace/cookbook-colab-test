# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require "open-uri"

recipes = [baked_salmon_with_avocado_mango_salsa, mediterranean_chicken_salad, shrimp_and_grits, beef_brisket_pot_roast]

recipes.each do |recipe|
  recipe = Nokogiri::HTML(open("http://www.simplyrecipes.com/recipes/#{recipe}/"))
  title = recipe.css("h1.entry-title")[0].content
  description = recipe.css(".recipe-description p")[0].content
  Recipe.create(:name => title, :content => description)
end

@twilio_client = Twilio::REST::Client.new(
  "gibberish",
  "gibberish"
)

@twilio_client.account.sms.messages.create(
  :from => 'gibberish',
  :to => '+gibberish',
  :body => "recipes added from seeds.rb!"
)