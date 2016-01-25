Rails.application.routes.draw do

  resources :categories
  resources :jobs
  root to: 'static#dashboard'
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
