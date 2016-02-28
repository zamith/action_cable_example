module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = User.find_by(remember_token: cookies["remember_token"])
    end
  end
end
