class RemovePastalCodeFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :pastal_code, :string
  end
end
