Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "foods#index"

  # resources :users do
  #   resources :recipes
  # end

  resources :foods, except: [:update]
  resources :recipes, except: [:update] do
    member do
      put :toggle_public
      delete 'food/:id', to: 'recipes#destroy_food', as: :destroy_food
    end
    resources :recipes_foods, only: %i[new create destroy]
  end
  get '/public_recipes', to: 'recipes#public_recipes'
  # get '/recipes/:id/recipes_foods/new', to: 'recipes_foods#new'
end
