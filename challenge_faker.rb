# #
# Ultimate Challenge
# Part 2
# Kelly Walters
#
# In a loop user Faker to generate 10 new categories.
# Within this same loop use the newly created and saved
#   category objects to generate 10 new products for each category.
#
require_relative 'ar.rb'

NUMBER_OF_RECORDS = 10

faker_beer = Faker::Beer
faker_doctor = Faker::DrWho
faker_sv = Faker::SiliconValley

NUMBER_OF_RECORDS.times do
  # categories will be beer styles
  new_category = faker_beer.unique.style

  puts "Creating category: #{new_category}"

  # save the data
  saved_category = Category.create(name: new_category)

  # create the new products
  NUMBER_OF_RECORDS.times do
    # product names will be a combo of a beer, a dr who character
    # and a silicon valley company
    new_product_name = faker_beer.name + ' ' + faker_doctor.character
    new_product_name += ' ' + faker_sv.company + rand(50).to_s

    puts "    Creating product: #{new_product_name}"

    prod_description = faker_beer.yeast + ' ' + faker_doctor.catch_phrase

    the_record = saved_category.products.build(name: new_product_name,
                                               description: prod_description,
                                               price: rand(25),
                                               stock_quantity: rand(50))
    the_record.save
  end
end
