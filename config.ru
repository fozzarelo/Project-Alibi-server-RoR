# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

# TODO Keep in mind in case we deploy
# if Rails.env.production?
#   DelayedJobWeb.use Rack::Auth::Basic do |username, password|
#     username == 'admin' && password == 'supersecret'
#   end
# end

run Rails.application
