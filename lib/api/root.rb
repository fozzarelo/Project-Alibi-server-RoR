module API
  class Root < Grape::API
    require 'date'

    prefix 'api'
    use Grape::Middleware::Logger

    before do
      error!('401 Unauthorized', 401) unless authenticated
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error!({ error: 'Bad Request', errors: e.full_messages }, 400)
    end

    rescue_from :all do |exception|
      fail exception
    end

    helpers do
      def authenticated
        params[:token].eql? Rails.application.secrets.api['token'].to_s
      end

      def session
        request.session
      end
    end

    mount API::V1::Root
  end
end