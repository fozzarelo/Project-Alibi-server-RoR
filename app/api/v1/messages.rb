module API
  module V1
    class Messages < Grape::API
      version 'v1'
      format :json

      helpers do
      end

      resource :messages do
        desc 'Send a message'
        params do
          requires :address, type: String
          requires :userEmail, type: String
          requires :targetEmail, type: String
          requires :lat, type: String
          requires :lon, type: String
          requires :photoLink, type: String
        end

        post :sendMessage do
          u = User.find_by_email(params[:userEmail])
          @msg = Message.new(user: u, target_email: params[:targetEmail], address: params[:address], picture: params[:photoLink])
          if @msg.save
            Footprint.send_footprint(@msg).deliver_later
          end
          message = {timeSent: @msg.created_at}
          return message
        end

        desc 'List of messages'
        params do
          requires :email, type: String
        end

        post :getMessages do
          if User.find_by_email(params['email'])
            sent_messages = User.find_by_email(params['email']).messages.order('created_at').limit(5)
          else
            sent_messages = []
          end

          if Message.where('target_email =?', params['email'])
            rec_messages = Message.where('target_email =?', params['email']).order('created_at').limit(5)
          else
            rec_messages = []
          end

          messages = [
                        {
                          cat: 'Sent:',
                          id: 1,
                          msgs: sent_messages.map { |msg| { msg: {
                                                              name: msg.target_email,
                                                              timeSent: msg.created_at.strftime("%d %b. %Y"),
                                                              location: msg.address,
                                                              md5: msg.target_email
                                                              }
                                                            }
                                                    }
                        },{
                          cat: 'Recieved:',
                          id: 2,
                          msgs: rec_messages.map { |msg| { msg:  {
                                                              name: msg.user.username,
                                                              timeSent: msg.created_at.strftime("%d %b. %Y"),
                                                              location: msg.address,
                                                              md5: msg.user.email
                                                              }
                                                            }
                                                  }
                        }
                      ]
          return messages
        end

      end
    end
  end
end
