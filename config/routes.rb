Rails.application.routes.draw do
	
	root 'sessions#home'
	get '/signup' => 'users#new'
	get '/login' => 'sessions#new'
	post '/login' => 'session#home'
  get '/logout' => 'sessions#destroy'

  devise_for :users
  resources :users
  resources :games
  resources :ratings
  resources :platform
  resources :sessions
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
