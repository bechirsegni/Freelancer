Rails.application.routes.draw do

  devise_for :users
  resources :jobs
  root to: 'static#dashboard'
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
