class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    current_user.online!
  end

  def unsubscribed
    current_user.offline!
  end
end
