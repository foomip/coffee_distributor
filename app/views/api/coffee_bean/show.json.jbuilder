json.coffee_bean do
  json.(@bean, :id, :name, :country)

  json.supplier_bean_costing_cheapest do
    json.partial! '/api/supplier/costing', costing: @bean.supplier_bean_costing_cheapest
  end

  json.supplier_bean_costing_fastest_delivery do
    json.partial! '/api/supplier/costing', costing: @bean.supplier_bean_costing_fastest_delivery
  end
end
