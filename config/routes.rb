Rails.application.routes.draw do
  
  root to: "mapevents#index"

  resources :mapevents
  resources :users
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

end
