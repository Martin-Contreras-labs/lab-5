class MessagesController < ApplicationController
    def index
      @messages = Message.all
    end
  
    def show
      @message = Message.find(params[:id])
    end
    def new
      @message = Message.new
      @users = User.all
      @chats = Chat.all
    end
  
    def create
      @message = Message.new(message_params)
      if @message.save
        redirect_to messages_path, notice: "Mensaje enviado exitosamente."
      else
        @users = User.all
        @chats = Chat.all
        render :new
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:body, :user_id, :chat_id)
    end
  end
  