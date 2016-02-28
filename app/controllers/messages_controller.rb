class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    if @message.save
      redirect_to messages_path
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
end
