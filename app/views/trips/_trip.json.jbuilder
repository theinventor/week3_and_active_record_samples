json.extract! trip, :id, :arrival_date, :departure_date, :destination_city, :created_at, :updated_at
json.url trip_url(trip, format: :json)
