json.extract! last_datum, :id, :devise, :PM2_5, :PM10, :positive_feeling, :mixed_feeling, :negative_feeling, :latitude, :longitude, :created_at, :updated_at
json.url last_datum_url(last_datum, format: :json)
