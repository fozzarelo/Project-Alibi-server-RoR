module API
  module V1
    class Addresses < Grape::API
      version 'v1'
      format :json

      helpers do
      end

      resource :addresses do
        desc 'translate coordinates'
        params do
          requires :coords, type: String
        end
        post :translateCoords do
          geo = Geocoder
          street_address = geo.address params[:coords]
          address = {streetAddress: street_address}
          return address
        end
      end
    end
  end
end
