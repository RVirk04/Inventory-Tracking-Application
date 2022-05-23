# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

Warehouse.destroy_all
Product.destroy_all

# Add file path of the csv file
csv_file = Rails.root.join('db/warehouse.csv')

csv_data = File.read(csv_file)
warehouse = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

warehouse.each do |wh|
  # Create a new warehouse
  warehouse = Warehouse.find_or_create_by(
    id: wh["id"],
    name: wh["name"],
    location: wh["location"]
  )
end

# Add file path of the csv file
csv_product_file = Rails.root.join('db/products.csv')

csv_product_data = File.read(csv_product_file)
product = CSV.parse(csv_product_data, headers: true, encoding: 'iso-8859-1')

product.each do |p|
  # Create a new product
  product = Product.find_or_create_by(
    id: p["id"],
    name: p["name"],
    description: p["details"],
    price: p["price"],
    warehouse_id: p["warehouse"]
  )
end