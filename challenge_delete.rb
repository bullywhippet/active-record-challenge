require_relative 'ar.rb'

# Find one of the products you created in challenge_create.rb and delete it from the database.

# find a product
dodo_product = Product.where(name: 'Dodo bird').first

# make sure its the right one
puts dodo_product.inspect

# actually delete the thing
dodo_product.destroy unless dodo_product.nil?
