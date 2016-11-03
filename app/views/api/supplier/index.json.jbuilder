json.coffee_bean do
  json.(@bean, :id, :name)

  json.supplier_bean_costings @bean.supplier_costings do |costing|
    json.partial! '/api/supplier/costing', costing: costing
  end
end
