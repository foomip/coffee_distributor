class SupplierBeanCosting
  attr_reader :supplier, :coffee_bean

  # pass either the model objects or the integer IDs for the relevant records
  def self.for coffee_bean, supplier
    coffee_bean_obj = coffee_bean.is_a?(CoffeeBean) ? coffee_bean : CoffeeBean.find(coffee_bean)
    supplier_obj    = supplier.is_a?(Supplier) ? supplier : Supplier.find(supplier)

    self.new coffee_bean_obj, supplier_obj
  end

  def initialize coffee_bean, supplier
    @coffee_bean = coffee_bean
    @supplier    = supplier

    raise 'Invalid supplier and coffee bean combination' unless coffee_bean.suppliers.include? supplier
  end

  def cost
    link.cost
  end

  def delivery_days
    link.delivery_days
  end

  def delivery_days_roasted
    delivery_days + roasting_extra_days
  end

  def price_raw
    cost * (1 + (coffee_bean.raw_cost_markup || 0) / 100)
  end

  def price_roasted
    cost * (1 + (coffee_bean.roasted_cost_markup || 0) / 100) + roasting_surcharge
  end

  def roasting_surcharge
    coffee_bean.roasting&.cost || 0
  end

  def roasting_extra_days
    coffee_bean.roasting&.days || 0
  end

  private

  def link
    @link ||= coffee_bean.coffee_bean_supplier_links.find_by supplier: supplier
  end
end
