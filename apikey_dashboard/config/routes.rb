ApikeyDashboard::Engine.routes.draw do
  # get 'users/new'
  #
  # get 'users/create'
  #
  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'
  #
  # get 'keys/index'
  #
  # get 'keys/new'
  #
  # get 'keys/create'
  #
  # get 'keys/destroy'
  #
  # get 'home/index'

  root 'home#index'
  get  '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get  '/logout' => 'sessions#destroy', as: :logout
  resources :users, only: [:new, :create], path_names: { new: 'register' }
  resources :keys, only: [:index, :new, :create, :destroy]
end
