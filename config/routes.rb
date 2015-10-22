Rails.application.routes.draw do
  root to: "home#index"
  get "/dashboard", to: "dashboard#index"

  get "/auth/:provider/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: :signout

  resources :users
  resources :teams do
    resources :posts
    post "/posts/:id/tweet", to: "posts#tweet", as: :tweet_post
  end

  post "/teams/:id/join", to: "teams#join", as: :join_team
  post "/teams/:id/leave", to: "teams#leave", as: :leave_team
end
