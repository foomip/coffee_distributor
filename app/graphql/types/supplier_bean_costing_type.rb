SupplierBeanCostingType = GraphQL::ObjectType.define do
  name          'SupplierBeanCosting'
  description   'The costing related information for a particular coffee bean, from a supplier'

  field :supplier, SupplierType, 'The relevant supplier record for this costing'
  field :price_raw, types.Float, 'The price for raw coffee beans'
  field :price_roasted, types.Float, 'The price of coffee beans, pre-roasted'
  field :delivery_days, types.Int, 'The number of days it will take to get the coffee delivered'
  field :delivery_days_roasted, types.Int,
    'The number of days it will take to get the coffee delivered, including days for roasting'
end
