class Coffee < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders
  
  def unique_customer_names
    # self.customers.pluck(:name)
    # customers.pluck(:name).uniq
    customers.distinct.pluck(:name)
  end

  def self.most_ordered
    binding.pry
    self.includes(:orders).all.max_by do |coffee|
      coffee.orders.length
    end
    # Order.select('id, coffee_id, count(coffee_id) as cnt').group(:coffee_id).order(:cnt).last.coffee
  end

end