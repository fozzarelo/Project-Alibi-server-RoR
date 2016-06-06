json.array!(@messages) do |message|
  json.extract! message, :id, :lat, :lon, :user_id, :target_email, :address, :picture
  json.url message_url(message, format: :json)
end
