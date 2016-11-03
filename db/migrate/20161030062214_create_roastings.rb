class CreateRoastings < ActiveRecord::Migration[5.0]
  def change
    create_table :roastings do |t|
      t.references :coffee_bean, foreign_key: true, index: false
      t.integer :days
      t.decimal :cost

      t.timestamps
    end

    add_index :roastings, :coffee_bean_id, unique: true
  end
end
