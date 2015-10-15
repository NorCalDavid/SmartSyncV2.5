Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  resources :users

  
  resources :properties
  resources :rooms
  resources :devices

  resources :event_groups
  
  resources :events do
    resources :actions
    resources :conditions
  end
  
  resources :statuses
  resources :status_options

  resources :location_options

  resources :comamnds
  
  resources :reminders
  
  root to: 'visitors#index'

end
