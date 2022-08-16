class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :coffee

  def receipt
    puts "#{self.customer.name} ordered #{self.coffee.title} for $#{self.price}"
  end
end