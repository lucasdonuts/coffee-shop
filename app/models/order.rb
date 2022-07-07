class Order < ActiveRecord::Base
  belongs_to :coffee 
  belongs_to :customer

  def receipt
    # print "#{customer.name} ordered a #{coffee.title} for $#{price}"
    # p "#{customer.name} ordered a #{coffee.title} for $#{price}"
    p "#{customer.name} ordered a #{coffee.title} for $#{price}"
  end

end