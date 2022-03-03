Order.destroy_all
Coffee.destroy_all
Customer.destroy_all

3.times do
  Customer.create(name: Faker::Name.name)
end

3.times do
  Coffee.create(title: Faker::Coffee.blend_name)
end

15.times do
  Order.create(price: rand(2..7), customer_id: Customer.ids.sample, coffee: Coffee.all.sample)
end