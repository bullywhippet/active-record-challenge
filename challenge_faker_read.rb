# In the challenge_faker_read.rb file:
# Find all the categories in the database (including those that you added using Faker).
# Display all category names and their associated products (name and price) in
#   a nicely formatted list.
#
require_relative 'ar.rb'

all_categories = Category.all

all_categories.each do |c|
  puts "Category: #{c.name}"
  c.products.each do |prod|
    puts "    Product: #{prod.name} for price: $#{prod.price}"
  end
end
