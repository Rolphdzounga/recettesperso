Rails.application.routes.draw do
  resources :pages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "pages/home", to: "pages#home"
  root "pages#index"
   

  resources :chefs, except:[:new]

  get '/signup', to:"chefs#new",as:"signup" 
	get '/login', to: 'sessions#new'
	post '/login', to: "sessions#create"
	delete '/logout', to: "sessions#destroy"

  resources :ingredients
  resources :commentaires
  resources :recettes do
    resources :commentaires, only: [:create]
  end
end
