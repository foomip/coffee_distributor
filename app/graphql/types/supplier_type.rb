SupplierType = GraphQL::ObjectType.define do
  name          'Supplier'
  description   'Supplier information'

  field :id, types.ID, 'The unique identifier for a supplier record'
  field :name, types.String, 'The unique name of a supplier'
end
