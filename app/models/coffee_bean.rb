class CoffeeBean < ApplicationRecord
  validates_uniqueness_of :name

  has_many :coffee_bean_supplier_links
  has_many :suppliers, through: :coffee_bean_supplier_links

  has_one :roasting

  def supplier_costings
    @supplier_costings ||= suppliers.map { |supplier| SupplierBeanCosting.for self, supplier }
  end

  def supplier_bean_costing_cheapest
    supplier_costings.reduce supplier_costings.first do |cheapest, costing|
      costing.cost < cheapest.cost ? costing : cheapest
    end
  end

  def supplier_bean_costing_fastest_delivery
    supplier_costings.reduce supplier_costings.first do |fastest, costing|
      costing.delivery_days < fastest.delivery_days ? costing : fastest
    end
  end
end
