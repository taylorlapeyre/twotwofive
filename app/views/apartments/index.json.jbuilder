json.array!(@apartments) do |apartment|
  json.extract! apartment, :name, :description, :address, :zipcode, :phone_number, :website_url, :featured, :slug, :geocode
  json.url apartment_url(apartment, format: :json)
end
