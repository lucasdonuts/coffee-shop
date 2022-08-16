puts "Seeding..."

Coffee.destroy_all
Order.destroy_all
Customer.destroy_all

Coffee.reset_pk_sequence
Order.reset_pk_sequence
Customer.reset_pk_sequence

10.times do
  Coffee.create(title: Faker::Coffee.unique.blend_name)
  Customer.create(name: Faker::Name.unique.name)
end

50.times do
  customer_id = Customer.all.sample.id
  coffee_id = Coffee.all.sample.id
  price = rand(1..5)
  Order.create(coffee_id: coffee_id, customer_id: customer_id, price: price)
end

puts "Done seeding"