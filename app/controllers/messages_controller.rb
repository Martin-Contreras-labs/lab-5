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
      redirect_to messages_path, notice: "Message send it correctly"
    else
      @users = User.all
      @chats = Chat.all
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
    @users = User.all
    @chats = Chat.all
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to @message, notice: "Message updated succesfully"
    else
      @users = User.all
      @chats = Chat.all
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :chat_id)
  end
end
