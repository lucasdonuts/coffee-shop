class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      # t.integer :customer_id
      # t.integer :coffee_id
      t.integer :price
      t.belongs_to :customer
      t.references :coffee
    end
  end
end
