Rails.application.routes.draw do

  get 'tasks/new'

  get 'sessions/new'

  root 'landing#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users


end
