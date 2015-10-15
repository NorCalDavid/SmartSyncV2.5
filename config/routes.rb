Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  
  resources :users do
    resources :reminders
  end

  resources :properties do
    member { get :delete }
  end

  resources :rooms
  resources :devices do
    member { get :adjust_dim_level }
  end

  resources :event_groups
  
  resources :events do
    resources :actions
    resources :conditions
  end
  
  resources :statuses
  resources :status_options
  resources :location_options
  resources :comamnds
    
  # defaults to dashboard
  root :to => 'visitors#index'

  # view routes
  get '/dashboard' => 'dashboard#index'
  post '/dashboard/refresh' => 'dashboard#refresh', as: :refresh
  get '/dashboard/properties/new' => 'dashboard#new_property'
  get '/dashboard/rooms/new' => 'dashboard#new_room'
  get '/dashboard/devices/new' => 'dashboard#new_device'

end
