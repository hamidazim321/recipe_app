# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipe, only: [:index, :show, :destroy, :create]
  get 'public_recipes', to: 'recipe#public_recipe'
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
