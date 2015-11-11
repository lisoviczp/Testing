json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :artist_type, :city, :image, :description
  json.url user_url(user, format: :json)
end
