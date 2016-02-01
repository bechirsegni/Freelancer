Rails.application.routes.draw do

  resources :jobs  do
    resources :bids
  end
  resources :showcases
  resources :articles
  resources :users, :only => [:show]
  root to: 'static#dashboard'
    devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_scope :user do
    get 'login', :to => 'devise/sessions#new'
    post 'login', :to => 'devise/sessions#new'
    get 'register', :to => 'devise/registrations#new'
    post 'register', :to => 'devise/registrations#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'password', to: 'devise/passwords#new'
    get 'account', to: 'devise/registrations#edit'
  end

  resources :categories
  get 'tags/:tag', to: 'jobs#index', as: :tag

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
