module API
  class Root < Grape::API
    require 'date'

    prefix 'api'
    use Grape::Middleware::Logger

    # In case we connot authenticate that the api is legit
    before do
      error!('401 Unauthorized', 401) unless authenticated
    end

    # In case the fetch call doesn't meet the given requitements
    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error!({ error: 'Bad Request', errors: e.full_messages }, 400)
    end

    rescue_from :all do |exception|
      fail exception
    end

    # Make sure that the api is legit by comparing tokens
    helpers do
      def authenticated
        puts params[:token]
        puts Rails.application.secrets.api['token'].to_s
        params[:token].eql? Rails.application.secrets.api['token'].to_s
      end

      def session
        request.session
      end
    end

    mount API::V1::Root
  end
end
