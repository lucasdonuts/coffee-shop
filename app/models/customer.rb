class Customer < ActiveRecord::Base
  has_many :orders
  has_many :coffees, through: :orders

  def self.names
    Customer.all.pluck(:name)
  end

  def find_coffee(coffee_title)
    Coffee.find_by(title: coffee_title)
  end

  def order_coffee(coffee_title, price)
    order = Order.create(coffee: find_coffee(coffee_title), price: price)
    self.orders << order
    order.receipt
  end

  def total_purchases_amount
    total = 0

    self.orders.map do |order|
      total += order.price
    end

    total
  end

  def dislike_coffee(coffee_title)
    order = self.orders.where(coffee: find_coffee(coffee_title)).last
    if order
      puts "#{self.name} has been refunded $#{order.price}"
      order.destroy
    else
      puts "#{self.name} hasn't ordered #{coffee_title}"
    end
  end

end