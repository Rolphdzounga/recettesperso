Rails.application.routes.draw do
  get 'recettes/index'

  get 'recettes/show'

  get 'recettes/new'

  get 'recettes/create'

  get 'recettes/edit'

  get 'recettes/update'

  get 'recettes/delete'

  get 'pages/home'

  get 'pages/index'

  get 'pages/new' 

  get 'pages/create'

  get 'pages/edit'

  get 'pages/update'

  get 'pages/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "pages/home", to: "pages#home"
  root "pages#index"
  get '/recettes', to: 'recettes#index'
end
