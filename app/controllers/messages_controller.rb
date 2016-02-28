class MessagesController < ApplicationController
  def index
    @users = User.all
    @messages = Message.where(room: nil)
    @special_messages = Message.where(room: "special")
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    if @message.save
      send_notifications
    else
      flash[:error] = "Could not send message"
      redirect_to messages_path
    end
  end

  private

  def message_params
    params.
      require(:message).
      permit(:body).
      merge(user: current_user)
  end

  def send_notifications
    ActionCable.server.broadcast "messages",
      message: @message.body
  end
end
