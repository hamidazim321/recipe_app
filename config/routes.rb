# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"
  resources :recipes do
    member do
      patch :update_public
    end
  end
  resources :inventories
  resources :foods, only: [:create, :destroy]
  resources :inventory_foods, only: [:create, :destroy]
  resources :recipe_foods, only: [:create, :destroy]
  
  get 'public_recipes', to: 'recipes#public_recipes'
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
