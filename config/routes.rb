Rails.application.routes.draw do
	
	root 'home#index'
	get '/signup' => 'user#new'
	get '/login' => 'sessions#new'
	post '/login' => 'session#create'

  devise_for :users
  resources :users
  resources :games
  resources :ratings
  resources :platform
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
