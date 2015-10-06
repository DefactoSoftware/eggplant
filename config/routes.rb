Rails.application.routes.draw do
  root to: 'home#index'

  get "/auth/:provider/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: :signout

  resources :posts
end
