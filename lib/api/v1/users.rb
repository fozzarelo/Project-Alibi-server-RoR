module API
  module V1
    class Users < Grape::API
      version 'v1'
      format :json

      helpers do
      end

      resource :users do
        desc 'Sign in the user'
        params do
          requires :username, type: String
          requires :password, type: String
        end

        post :signin do
          User.find_by(username: params[:username], password: params[:password])
        end

        desc 'Sign up a user'
        params do
          requires :username, type: String
          requires :password, type: String
        end

        post :signup do
          error!({error: 'Username already in use'}, 400) if User.find_by(username: params[:username])
          User.create(username: params[:username], password: params[:password])
        end
      end
    end
  end
end