#
# Create three new products using the 3 different ways to create new AR objects.
#
require_relative 'ar.rb'

#
# create a product way number 1
#
new_product_one = Product.new

new_product_one.name = 'New thing one swims'
new_product_one.description = 'This thing is a fish with a light on its head'
new_product_one.price = 12
new_product_one.stock_quantity = 5
new_product_one.category_id = 8

# persist it
new_product_one.save

# make sure its there
puts new_product_one.inspect

#
# create a product way 2
#
new_product_two = Product.new(name: 'Big Mac Sauce',
                              description: 'Its the second new product',
                              price: 2,
                              stock_quantity: 10,
                              category_id: 2)
# save it
new_product_two.save
puts new_product_two.inspect

#
# Create a product way 3
#
new_product_three = Product.create(name: 'Dodo bird',
                                   description: 'I think this is poultry',
                                   price: 35,
                                   stock_quantity: 2,
                                   category_id: 6)

puts new_product_three.inspect

#
# Create a Product object that is missing some required columns.
# Attempt to save this product and print all the AR errors which are generated.
#

bad_product = Product.new(name: 'Dog fur')

# attempt the save
if bad_product.save
  puts 'By some sorcery it saved'
else
  puts "Could not save #{bad_product}"
  # loop through errors
  bad_product.errors.messages.each do |column, errors|
    errors.each do |error|
      puts "The #{column} property #{error}"
    end
  end
end