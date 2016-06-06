json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password_digest, :has_account, :is_admin
  json.url user_url(user, format: :json)
end
