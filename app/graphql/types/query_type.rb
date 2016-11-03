QueryType = GraphQL::ObjectType.define do
  name        'Query'
  description 'The query root of this schema. See available queries.'

  # get coffee beans, paginated or by id
  field :coffee_bean, CoffeeBeanType do
    description 'The root query point, fetch a single coffee bean record'

    argument :id, !types.ID

    resolve ->(_obj, args, _ctx) {
      CoffeeBean.find args['id']
    }
  end

  field :coffee_beans, types[CoffeeBeanType] do
    description 'The root query point, fetch coffee bean records'

    argument :page, types.Int
    argument :order, types.String
    argument :country, types.String

    resolve ->(_obj, args, ctx) {
      page_size = ctx[:page_size]
      order     = args['order'] || 'name'
      skip_recs = page_size * (args[:page] || 0)

      query = CoffeeBean.order(order).limit(page_size).offset(skip_recs)

      query = query.where country: args['country'] if args.key? 'country'

      query
    }
  end
end
