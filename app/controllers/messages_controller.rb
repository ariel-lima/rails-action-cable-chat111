class MessagesController < ApplicationController
    def show
      @chatroom = Chatroom.find(params[:id])
      @message = Message.new
    end
    def create
      # content, chatroom , user
      @chatroom = Chatroom.find(params[:chatroom_id])
      @message = Message.new(message_params)
      # @message.chatroom_id = @chatroom.id
      @message.chatroom = @chatroom
      # @message.user_id = current_user.id
      @message.user = current_user

      if @message.save
        redirect_to chatroom_path(@chatroom)
      else
        render "chatrooms/show", status: :unprocessable_entity
      end
    end

    private

    def message_params
      params.require(:message).permit(:content)
    end

end
