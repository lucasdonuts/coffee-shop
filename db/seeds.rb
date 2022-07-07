Coffee.destroy_all
Customer.destroy_all
Order.destroy_all

3.times do
  # coffee = Coffee.new
  # coffee.save
  Coffee.create(title: Faker::Coffee.blend_name)
end

3.times do
  Customer.create( name: Faker::Name.name )
end


20.times do
  Order.create(price: rand(1..10), customer_id: Customer.ids.sample, coffee_id: Coffee.ids.sample )
end