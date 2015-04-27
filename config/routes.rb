Rails.application.routes.draw do

  root 'landing#index'
  get 'signup' => 'users#new'

  resources :users


end
