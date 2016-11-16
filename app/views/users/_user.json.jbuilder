json.extract! user, :id, :email, :password, :firstName, :lastName, :active, :admin, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)