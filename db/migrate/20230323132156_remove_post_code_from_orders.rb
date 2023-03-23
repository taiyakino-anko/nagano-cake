class RemovePostCodeFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :post_code, :integer
  end
end
