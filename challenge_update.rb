require_relative 'ar.rb'

# Find all products with a stock quantity greater than 40.
# Add one to the stock quantity of each of these products
# and then save these changes to the database.
#

products_big_quantity = Product.where('stock_quantity > 40')

# see original quantities
products_big_quantity.each { |c| puts c.stock_quantity }

products_big_quantity.each do |prod|
  prod.stock_quantity += 1
  prod.save
end

# proof that it updated
products_big_quantity.each { |c| puts c.stock_quantity }