# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  mount_devise_token_auth_for "User", at: "api/auth"

  namespace :api do
    resources :products, only: [:index]
  end
end
