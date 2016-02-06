Rails.application.routes.draw do

  resources :jobs  do
    resources :bids
  end
  resources :showcases
  resources :articles
  resources :categories

  get 'tags/:tag', to: 'jobs#index', as: :tag

  get 'projects',  to: 'static#myprojects'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_scope :user do
    get   'login',      :to => 'devise/sessions#new'
    post  'login',      :to => 'devise/sessions#new'
    get   'register',   :to => 'devise/registrations#new'
    post  'register',   :to => 'devise/registrations#new'
    delete 'logout',    to: 'devise/sessions#destroy'
    get   'password',   to: 'devise/passwords#new'
    get   'account',    to: 'devise/registrations#edit'
    get   'u/:id' ,     to: 'users#show', :as => 'profile'
    get   'freelancers',to: 'users#index'

    authenticated :user do
      root 'static#dashboard', as: :authenticated_root
    end

    unauthenticated do
      root 'frontend#index',    as: :unauthenticated_root
    end
  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
