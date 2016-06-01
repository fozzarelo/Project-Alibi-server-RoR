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
          requires :email, type: String
          requires :password, type: String
        end

        post :signin do
          u = User.find_by_email(params[:email])
          contacts  = u.contactings.map{|c| [c.nickname, c.contact.email]}
          puts Hash[contacts]
          user = {username: u.username, email: u.email, contacts: Hash[contacts]}
          return user if u && u.authenticate(params[:password])
        end

        desc 'Sign up a user'
        params do
          requires :username, type: String
          requires :password, type: String
          requires :email, type: String
        end

        post :signup do
          user = User.create(username: params[:username], password: params[:password], email: params[:email])
          error!({error: user.errors.full_messages}, 400) if !user.persisted?
          return user
        end
      end
    end
  end
end
