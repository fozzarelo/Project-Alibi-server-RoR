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
          user = {error: u.errors, username: u.username, email: u.email, contacts: Hash[contacts]}
          return user if u && u.authenticate(params[:password]) && u.has_account
        end

        desc 'Sign up a user'
        params do
          requires :username, type: String
          requires :password, type: String
          requires :email, type: String
        end

        post :signup do
          u = User.create(username: params[:username], password: params[:password], email: params[:email], has_account: true)
          error!({error: u.errors.full_messages}, 400) if !u.persisted?
          user = {error: u.errors.full_messages, username: u.username, email: u.email, contacts: {}}
          puts user
          return user
        end

        desc 'Add a contact a user'
        params do
          requires :contactNickname, type: String
          requires :contactEmail, type: String
        end

        #TODO arregla esto para que grabe el contacting. tienes que encontrar los user id con el mail. el nick ya viene
        # Despues, assegurate de mandar la nueva lista de contactos, esa va al async storage de contacts
        # y quita ese byebug!
        post :addContact do
          u = User.create(email: params[:contactEmail], has_account: false, username: '__blank__', password: '__blank__')
          cont = Contacting.create(nickname: ,user_id:, contact_id:)
          byebug
          # user = {error: u.errors.full_messages, username: u.username, email: u.email, contacts: {}}
          puts user
          return u
        end

      end
    end
  end
end
