require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes

def db_seed

	Product.clean

  30.times do
    names = Faker::Commerce.product_name
    brands = Faker::Company.name
    prices = Faker::Commerce.price
    Product.create(	name: names, 
    				brand: brands, 
    				price: prices)
  end

end
