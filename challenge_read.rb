#
# Ultimate Challenge
# Part 1
# Kelly Walters
#
require_relative 'ar.rb'

# Find any product from db
any_product = Product.last.inspect

puts any_product

# <Product    id: 231,
#           name: "Original Frankfurter grÃ¼ne SoÃŸe",
#    description: "12 boxes",
#          price: 0.13e2,
# stock_quantity: 32,
#    category_id: 2,
#     created_at: "2011-11-18 04:48:53",
#     updated_at: "2011-11-18 04:48:53">
#
# Columns = id, name, description, price,
#           stock_quantity, category_id, created_at, updated_at
#
# category_id is a foreign key
#

# Question: Based on the columns you find, can you determine
# if the products table has an association with any
# other tables? If so, what table?
#
# category_id belongs to the categories table.
# Printed out list to see what else there was.
puts "List of Tables #{ActiveRecord::Base.connection.tables}"

# Total number of products
number_of_products = Product.count
puts "There are #{number_of_products} in the products table."

# The names of all products above $10 with names that begin with the letter C.
c_products = Product.where('name LIKE "C%"').where('price > 10')
puts "Products whose name starts with C & are more than $10: #{c_products.count}"

# Total number of products with a low stock quantity.
# (Low is defined as less than 5 in stock.)
low_stock_items = Product.where('stock_quantity < 5')
puts "Number of items with low stock: #{low_stock_items.count}"


#
# Add to the challenge_read.rb file:
#

# Find the name of the category of one of the products you have found.
found_product = Product.find(214)
found_product_category = found_product.category

puts found_product_category.name


# Find a specific category and use it to build and persist a new product

bird_category = Category.where('name LIKE "%poultry%"').first

puts bird_category.inspect

new_product = bird_category.products.build(name: 'Emu',
                                           description: 'Emu is a bird and meat',
                                           price: 20,
                                           stock_quantity: 10)
new_product.save

puts new_product.inspect

# Find a specific category and then use it to locate all the the associated
#     products over a certain price

# get a category
specific_category = Category.where('name LIKE "%condiment%"').first
# see what allis in that category
specific_category.products.each { |p| puts p.name }

# add the price clause
specific_category_and_price = specific_category.products.where('price >10')
# show the new narrower list
specific_category_and_price.each { |p| puts p.name }