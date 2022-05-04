json.extract! cart, :id, :user_id, :checked_out_at, :uuid, :created_at, :updated_at
json.url cart_url(cart, format: :json)
