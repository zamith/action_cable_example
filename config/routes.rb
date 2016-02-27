Rails.application.routes.draw do
  root to: "pages#welcome"

  mount ActionCable.server => '/cable'
end
