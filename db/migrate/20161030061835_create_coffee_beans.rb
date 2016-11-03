class CreateCoffeeBeans < ActiveRecord::Migration[5.0]
  def change
    create_table :coffee_beans do |t|
      t.string :name
      t.string :country
      t.integer :raw_cost_markup
      t.integer :roasted_cost_markup

      t.timestamps
    end

    add_index :coffee_beans, :name, unique: true
  end
end
