json.array!(@buses) do |bus|
  json.extract! bus, :id, :bus_type, :seats, :fare, :departure_time, :arrival_time, :agency_id
  json.url bus_url(bus, format: :json)
end
