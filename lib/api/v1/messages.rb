module API
  module V1
    class Messages < Grape::API
      version 'v1'
      format :json

      helpers do
      end

      resource :messages do
        desc 'translate coordinates'
        params do
          requires :coords, type: String
        end
        post :translateCoords do
          byebug
          message = {address: "here goes the adress!"}
          return message
        end

      end
    end
  end
end
