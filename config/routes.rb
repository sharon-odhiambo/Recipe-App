Rails.application.routes.draw do
  
  devise_for :users, sign_out_via: [:get, :post]
  root "inventories#index"
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
  get '/new_recipe', to: "recipe#new_recipe"
  post '/add_new_recipe', to: "recipe#add_new_recipe"
  get 'recipes/:recipe_id/remove/:recipe_food_id', to: "recipe#remove_food"
  
  get 'recipes/:recipe_id/add_food/', to: "recipefood#new"
  post 'recipes/:recipe_id/add_food/', to: "recipefood#create"
  get '/shopping_list/:recipe_id', to: "recipefood#show_list"
end
