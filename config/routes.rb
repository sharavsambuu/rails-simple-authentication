Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'gif#cool'

  get '/cool' => 'gif#cool'
  get '/protected' => 'protected#index'
  get '/about' => 'about#index'
 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
