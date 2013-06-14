# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require "open-uri"

@bsams_raw = Nokogiri::HTML(open("http://www.simplyrecipes.com/recipes/baked_salmon_with_avocado_mango_salsa/"))
@bsams_name = @bsams_raw.css("h1.entry-title")[0].content
@bsams_content = @bsams_raw.css(".recipe-description p")[0].content
@bsams_recipe = Recipe.create(:name => @bsams_name, :content => @bsams_content)

@mcs_raw = Nokogiri::HTML(open("http://www.simplyrecipes.com/recipes/mediterranean_chicken_salad/"))
@mcs_name = @mcs_raw.css("h1.entry-title")[0].content
@mcs_content = @mcs_raw.css(".recipe-description p")[0].content
@mcs_recipe = Recipe.create(:name => @mcs_name, :content => @mcs_content)

@sg_raw = Nokogiri::HTML(open("http://www.simplyrecipes.com/recipes/shrimp_and_grits/"))
@sg_name = @sg_raw.css("h1.entry-title")[0].content
@sg_content = @sg_raw.css(".recipe-description p")[0].content
@sg_recipe = Recipe.create(:name => @sg_name, :content => @sg_content)

@bbpr_raw = Nokogiri::HTML(open("http://www.simplyrecipes.com/recipes/beef_brisket_pot_roast/"))
@bbpr_name = @bbpr_raw.css("h1.entry-title")[0].content
@bbpr_content = @bbpr_raw.css(".recipe-description p")[0].content
@bbpr_recipe = Recipe.create(:name => @bbpr_name, :content => @bbpr_content)


@twilio_client = Twilio::REST::Client.new(
  "gibberish",
  "gibberish"
)

@twilio_client.account.sms.messages.create(
  :from => 'gibberish',
  :to => '+gibberish',
  :body => "recipes added from seeds.rb!"
)