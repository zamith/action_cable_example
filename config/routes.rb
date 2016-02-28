Rails.application.routes.draw do
  root to: "messages#index"

  resources :messages, only: [:index, :create]

  mount ActionCable.server => '/cable'
end
