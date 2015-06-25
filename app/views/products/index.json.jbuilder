json.array!(@products) do |product|
  json.extract! product, :id, :title, :price, :description, :inventory
  json.url product_url(product, format: :json)
end
