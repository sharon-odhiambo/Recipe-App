Rails.application.routes.draw do
  
  devise_for :users, sign_out_via: [:get, :post]
  root "users#index"
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :inventories, only: [:index, :show, :new, :create, :destroy] do
    resources :inventory_food
  end
  resources :recipe, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/recipes', to: "recipe#index"
  get '/public_recipes', to: "recipe#public_recipes"
  get '/recipes/:id', to: "recipe#show"
  get '/recipes/:id/:inventory_id', to: "recipe#show_list"
  post '/recipes/:id', to: "recipe#create_shopping_list", as: "recipe_shopping"
  get '/new_recipe', to: "recipe#new_recipe"
  post '/add_new_recipe', to: "recipe#add_new_recipe"
  
  get 'recipes/:recipe_id/add_food/', to: "recipefood#new"
  post 'recipes/:recipe_id/add_food/', to: "recipefood#create"

end
