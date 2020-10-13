Rails.application.routes.draw do
	 devise_for :users
	root 'home#index'

  get '/sessions/user' => 'user_session_path'
  post '/sessions/user' => 'user_session_path'
	get '/signup' => 'users#new'
	get '/login' => 'sessions#new'
	post '/login' => 'session#home'
  get '/logout' => 'sessions#destroy'

 
  resources :users
  resources :games
  resources :ratings
  resources :platform

 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
