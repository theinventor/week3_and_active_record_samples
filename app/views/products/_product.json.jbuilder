json.extract! product, :id, :name, :description, :price_retail_cents, :product_category, :created_at, :updated_at
json.url product_url(product, format: :json)
