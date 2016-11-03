class AddSpeciesColumnToCoffeeBeans < ActiveRecord::Migration[5.0]
  def change
    add_column :coffee_beans, :species, :string
  end
end
