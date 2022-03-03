class Customer < ActiveRecord::Base
  has_many :orders
  has_many :coffees, through: :orders

  def self.names
    # self.pluck(:name)
    pluck(:name)
  end

  def order_coffee(coffee_title, price)
    coffee = Coffee.find_by(title: coffee_title)
    order = Order.create(price: price, coffee_id: coffee.id, customer_id: self.id)
    order.receipt
  end

  def total_purchases_amount
    # self.orders.sum(:price)
    orders.sum(:price)
  end

  def dislike_coffee(coffee_title)
    coffee = Coffee.find_by(title: coffee_title)
    # order_destroyed = self.orders.where(coffee_id: coffee.id).last.destroy
    order_destroyed = self.orders.order(id: :desc).find_by(coffee_id: coffee.id).destroy
    "#{self.name} has been refunded $#{order_destroyed.price}"
  end

end