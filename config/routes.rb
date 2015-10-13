Rails.application.routes.draw do
  resources :comamnds
  resources :event_actions
  resources :event_conditions
  resources :event_groups
  resources :events
  resources :location_options
  resources :status_options
  resources :statuses
  resources :devices
  resources :rooms
  resources :properties
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :users
end
