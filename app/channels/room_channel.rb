class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rooms_#{params[:room]}"
  end

  def receive(data)
    message = Message.new data.merge(user: current_user, room: params[:room])
    if message.save
      ActionCable.server.broadcast "rooms_#{params[:room]}",
        message: data["body"]
    end
  end
end

