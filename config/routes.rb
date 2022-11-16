Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipe, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/recipes', to: "recipe#index"
  get '/public_recipes', to: "recipe#public_recipes"
  get '/recipes/:id', to: "recipe#show"
  get '/add_food/:id', to: "recipe#new"
  post '/add_food/:id', to: "recipe#create"
  # delete '/recipes/:id', to: "recipe#destroy"

end
