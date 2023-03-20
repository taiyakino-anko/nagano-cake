class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.string :explanation, null: false
      t.integer :price, null: false
      t.integer :selling_status, default: 0, null: false
      

      t.timestamps
    end
  end
end
