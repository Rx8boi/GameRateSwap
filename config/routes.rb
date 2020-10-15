Rails.application.routes.draw do
	 devise_for :users
	root 'home#index'

  resources :users
  resources :games do
    resources :ratings, only: [:new, :index]
  end
  resources :ratings
  resources :platforms

 get '/auth/:provider/callback' => 'sessions#omniauth'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
