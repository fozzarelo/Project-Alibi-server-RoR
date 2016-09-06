module API
  module V1
    class Root < Grape::API
      version 'v1', using: :path
      mount API::V1::Users
      mount API::V1::Messages
      mount API::V1::Addresses
    end
  end
end
