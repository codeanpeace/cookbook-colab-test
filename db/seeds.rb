# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require "open-uri"

def pop_from_url(url)
  @raw = Nokogiri::HTML(open(url))
  @name = @raw.css("h1.entry-title")[0].content
  @content = @raw.css(".recipe-description p")[0].content
  @recipe = Recipe.create(:name => @name, :content => @content)
end

url_list = ["http://www.simplyrecipes.com/recipes/baked_salmon_with_avocado_mango_salsa/",
  "http://www.simplyrecipes.com/recipes/mediterranean_chicken_salad/",
  "http://www.simplyrecipes.com/recipes/shrimp_and_grits/",
  "http://www.simplyrecipes.com/recipes/beef_brisket_pot_roast/"]

url_list.each do |url|
  pop_from_url(url)
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