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
          if u && u.authenticate(params[:password]) && u.has_account == true
            contacts  = u.contactings.map{|c| [c.nickname, c.contact.email]}
            user = {username: u.username, email: u.email, contacts: Hash[contacts]}
          else
            user = {error: "Wrong credentials"}
          end
          return user
        end

        desc 'Sign up a user'
        params do
          requires :username, type: String
          requires :password, type: String
          requires :email, type: String
        end

        post :signup do
          u = User.create(username: params[:username], password: params[:password], email: params[:email], has_account: true)
        #  error!({error: u.errors.full_messages}, 400) if !u.persisted?
          user = {error: u.errors.full_messages, username: u.username, email: u.email, contacts: {}}
          return user
        end

        desc 'Add a contact a user'
        params do
          requires :contactNickname, type: String
          requires :contactEmail, type: String
        end

        post :addContact do
          User.create(email: params[:contactEmail], has_account: false, username: '__blank__', password: '__blank__')

          con = User.find_by_email(params[:contactEmail])
          u = User.find_by_email(params[:userEmail])
          Contacting.create(nickname: params[:contactNickname], user_id: u.id, contact_id: con.id)
          contacts  = u.contactings.map{|c| [c.nickname, c.contact.email]}
          user = {error: [], contacts: Hash[contacts]}
          return user
        end

      end
    end
  end
end
