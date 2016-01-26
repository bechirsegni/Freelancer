Rails.application.routes.draw do

  resources :jobs
  root to: 'static#dashboard'

  devise_for :users
  devise_scope :user do
    get 'login', :to => 'devise/sessions#new'
    post 'login', :to => 'devise/sessions#new'
    get 'register', :to => 'devise/registrations#new'
    post 'register', :to => 'devise/registrations#new'
    get 'logout', to: 'devise/sessions#destroy'
    get 'password', to: 'devise/passwords#new'
    get 'account', to: 'devise/registrations#edit'
  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
