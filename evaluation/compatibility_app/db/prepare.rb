ActiveRecord::Schema.verbose = false

ActiveRecord::Schema.define do
  create_table :addresses, force: true do |table|
    table.string :addressable_type, null: false
    table.integer :addressable_id, null: false
  end

  create_table :customers, force: true do |table|
    table.string :name
  end

  create_table :foods, force: true do |table|
    table.integer :shop_id
    table.string :name
    table.integer :price
    table.string :type
  end

  create_table :order_foods, force: true do |table|
    table.integer :food_id
    table.integer :order_id
  end

  create_table :orders, force: true do |table|
    table.integer :address_id
    table.integer :customer_id
  end

  create_table :shops, force: true do |table|
    table.string :name
  end
end

high_spend_customer = Customer.create!(name: "High spend")
low_spend_customer = Customer.create!(name: "Low spend")
popular_address = high_spend_customer.addresses.create!
other_address = low_spend_customer.addresses.create!

mixed_shop = Shop.create!(name: "Mixed")
ordered_only_shop = Shop.create!(name: "Ordered only")
unordered_only_shop = Shop.create!(name: "Unordered only")
Shop.create!(name: "No foods")

high_price_food = JapaneseFood.create!(
  shop: mixed_shop,
  name: "Ordered high price",
  price: 700
)
JapaneseFood.create!(shop: mixed_shop, name: "Unordered", price: 300)
low_price_food = ChineseFood.create!(
  shop: ordered_only_shop,
  name: "Ordered low price",
  price: 100
)
ItalianFood.create!(
  shop: unordered_only_shop,
  name: "Also unordered",
  price: 400
)

3.times do
  order = high_spend_customer.orders.create!(address: popular_address)
  order.order_foods.create!(food: high_price_food)
end

low_spend_order = low_spend_customer.orders.create!(address: other_address)
low_spend_order.order_foods.create!(food: low_price_food)
