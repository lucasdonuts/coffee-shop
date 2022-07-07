class Customer < ActiveRecord::Base
  has_many :orders
  has_many :coffees, through: :orders

  def self.names
    pluck(:name)
  end

  def order_coffee(coffee, price)
    # coffee = Coffee.find_by( title: coffee )
    order = Order.create(price: price, customer_id: id, coffee_id: coffee.id)
    order.receipt
  end

  def total_purchases_amount
    orders.sum(:price)
  end

  # given a coffee instance as an argument not a coffee_title liked specfied in README
  def dislike_coffee(coffee)
    # coffee = Coffee.find_by(title: coffee_title)
    order_to_delete = orders.where('coffee_id = ?', coffee.id).last.destroy
    puts "#{name} has been refunded $#{order_to_delete.price}"
  end
end