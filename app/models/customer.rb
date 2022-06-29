class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :coffees, through: :orders

  def self.names
    # all.map{|customer|customer.name}
    pluck(:name)
  end

  def order_coffee(coffee_title, price)
    coffee = Coffee.find_by(title: coffee_title)
    Order.create(customer: self, coffee: coffee, price: price)
  end

  def total_purchases_amount
    # orders.pluck(:price).sum
    orders.sum(:price)
  end

  def dislike_coffee(coffee_title)
  
    coffee = Coffee.find_by(title: coffee_title)
    order = orders.order(id: :desc).find_by(coffee_id: coffee.id)
    order.destroy

    puts "#{name} has been refunded $#{order.price}"

  end

end
