class CreateCoffeeBeanSupplierLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :coffee_bean_supplier_links do |t|
      t.references :coffee_bean, foreign_key: true
      t.references :supplier, foreign_key: true
      t.decimal :cost
      t.integer :delivery_days

      t.timestamps
    end

    add_index :coffee_bean_supplier_links, [:coffee_bean_id, :supplier_id], unique: true, name: 'uidx_supp_bean_link'
  end
end
