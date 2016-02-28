class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
  end

  def receive(data)
    message = Message.new data.merge(user: current_user)
    if message.save
      ActionCable.server.broadcast "messages",
        message: data["body"]
    end
  end
end
