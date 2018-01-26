# In a loop user Faker to generate 10 new categories.
# Within this same loop use the newly created and saved
#   category objects to generate 10 new products for each category.
#
require_relative 'ar.rb'

faker_foods = Faker::Config

10.times do
  puts faker_foods.r
end