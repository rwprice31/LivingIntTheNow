json.extract! store, :id, :email, :companyName, :address, :zipCode, :created_at, :updated_at
json.url store_url(store, format: :json)