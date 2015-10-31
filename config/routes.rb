Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    sessions: 'users/sessions',
                                    confirmations: 'users/confirmations',
                                    passwords: 'users/passwords',
                                    registrations: 'users/registrations',
                                    unlocks: 'users/unlocks' }

  devise_scope :user do
    match '/users/:id/finish_signup' => 'users/omniauth_callbacks#finish_signup', via: [:get, :patch], :as => :finish_signup
    get '/users/cancel_account' => 'users/registrations#cancel_account', via: [:get], :as => :cancel_account
  end
  
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  get '/users/profile' => 'users/users#profile', as: :user_profile 
  get '/users/github' => 'users/users#github', as: :user_github 
  get '/users/twitter' => 'users/users#twitter', as: :user_twitter


  # Liftmaster MyQ Device Controls
  resource :myq, controller: 'myq/control', only: :none do
    member do
      get '/authenticate' => 'myq/control#auth', as: :authenticate_myq
    end

    resources :doors, controller: 'myq/control', only: [:index] do
      collection do
        get '/count' => 'myq/control#count'
        get '/open' => 'myq/control#open'
        get '/close' => 'myq/control#close'
        get '/status' => 'myq/control#status' 
      end 
    end
  end

  # Insteon Device and Account Controls
  resource :insteon, controller: 'insteon/connect', only: :none do
    member do
      get '/authenticate' => 'insteon/connect#auth', as: :authenticate_insteon
      get '/authenticate/token' => 'insteon/connect#callback'
    end

    resources :accounts, controller: 'insteon/account'
    resources :houses, controller: 'insteon/house'
    resources :rooms, controller: 'insteon/room'

    resources :devices, controller: 'insteon/device', only: :index do
      collection do
        get '/import' => 'insteon/device#import'
        post '/create' => 'insteon/device#create'
      end

      member do
        get '/on' => 'insteon/control#on'
        get '/fast_on' => 'insteon/control#fast_on'
        get '/off' => 'insteon/control#off'
        get '/fast_off' => 'insteon/control#fast_off'
        get '/instant_on' => 'insteon/control#instant_on'
        get '/start_dim_up' => 'insteon/control#start_dim_up'
        get '/start_dim_down' => 'insteon/control#start_dim_down'
        get '/stop_dim' => 'insteon/control#stop_dim'
        get '/beep' => 'insteon/control#beep'
        get '/status' => 'insteon/control#status'
      end
    end
  end

  resources :properties do
    member { get :delete }
  end

  resources :rooms
  resources :devices do
    member { get :adjust_dim_level }
  end

  resources :event_groups, controller: 'events/groups'
  
  resources :events, except: :show do
    get :delete
  end

  resources :schedules, controller: 'schedules/schedules' do
    get :calendar, on: :collection, as: :schedule_calendar
    
    resources :action_series, controller: 'schedules/action_series'
    resources :actions, controller: 'schedules/actions'
  end

  resources :reminders
  post '/reminders/refresh_form' => 'reminders#refresh_form'

scope module: 'admin' do
  resources :articles, :comments
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
