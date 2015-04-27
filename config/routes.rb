Rails.application.routes.draw do

  root 'landing#index'

  get 'users/show'

  get 'users/new'

  get 'users/create'


end
