class CoffeeBeanSupplierLink < ApplicationRecord
  belongs_to :coffee_bean
  belongs_to :supplier

  validates_uniqueness_of :coffee_bean_id, scope: :supplier_id
end
