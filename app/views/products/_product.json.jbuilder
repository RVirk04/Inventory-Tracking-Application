json.extract! product, :id, :name, :price, :color, :description, :warehouse_id, :created_at, :updated_at
json.url product_url(product, format: :json)
