class RemovePatmentMethodFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :patment_method, :integer
  end
end
