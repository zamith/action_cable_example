class User < ActiveRecord::Base
  include Clearance::User

  enum status: [:offline, :online, :away]
end
