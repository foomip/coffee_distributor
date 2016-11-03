CoffeeBeanType = GraphQL::ObjectType.define do
  name            'CoffeeBean'
  description     'The information for the different coffee beans'

  field :id, types.ID, 'The unique identifier for a coffee bean record'
  field :name, types.String, 'The unique name for this coffee bean'
  field :country, types.String, 'Country of rigin for the bean'
  field :supplier_bean_costings do
    description 'The costings from all suppliers for this coffee bean'
    type types[SupplierBeanCostingType]

    resolve ->(obj, _args, _ctx) { obj.supplier_costings }
  end

  field :supplier_bean_costing_cheapest do
    description 'The cheapest cost, from the different suppliers, for this coffee bean'
    type SupplierBeanCostingType

    resolve ->(obj, _args, _ctx) { obj.supplier_bean_costing_cheapest }
  end

  field :supplier_bean_costing_fastest_delivery do
    description 'The fastest delivery, from the different suppliers, for this coffee bean'
    type SupplierBeanCostingType

    resolve ->(obj, _args, _ctx) { obj.supplier_bean_costing_fastest_delivery }
  end
end
