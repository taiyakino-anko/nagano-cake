class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :post_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :delivery_cost, default: 800, null: false
      t.integer :payment_method, default: 0
      t.integer :order_status, default: 0
      t.integer :total_payment, null: false

      t.timestamps
    end
  end
end
