class Coffee < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders

  def unique_customer_names
    self.customers.pluck(:name).uniq
  end

  def self.most_ordered
    scores = {}

    Coffee.all.map do |coffee|
      scores[coffee] = coffee.orders.length
    end

    scores.sort_by{ |k, v| v }.first.first
  end

end