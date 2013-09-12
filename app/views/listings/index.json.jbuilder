json.array!(@listings) do |listing|
  json.extract! listing, :name, :address, :zip, :descrption, :contact_email, :phone_number, :website_url, :featured, :slug, :geocode, :active, :neighborhood_id
  json.url listing_url(listing, format: :json)
end
