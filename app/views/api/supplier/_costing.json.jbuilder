json.supplier do
  json.id     costing.supplier.id
  json.name   costing.supplier.name
end

json.price_raw              costing.price_raw
json.price_roasted          costing.price_roasted
json.delivery_days          costing.delivery_days
json.delivery_days_roasted  costing.delivery_days_roasted
