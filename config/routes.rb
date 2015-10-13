Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :users
end
