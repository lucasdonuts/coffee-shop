class Coffee < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders

  def unique_customer_names
    self.customers.distinct.pluck(:name)
  end

  def self.most_ordered
    # n + 1 queries
    all.max_by {|coffee| coffee.orders.count}

    # just 2 queries
    Order.select('coffee_id, count(coffee_id) as cnt').group(:coffee_id).order(cnt: :desc).first.coffee

    # another way to make just 2 queries is with the includes method but use ruby array length instead of active record count method
    Coffee.includes(:orders).all.max_by {|coffee| coffee.orders.length}
  end
end