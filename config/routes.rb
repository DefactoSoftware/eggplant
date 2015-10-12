Rails.application.routes.draw do
  root to: 'home#index'

  get "/auth/:provider/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: :signout

  resources :posts
  resources :users
  resources :teams

  post "/teams/:id/join", to: "teams#join", as: :join_team
  post "/teams/:id/leave", to: "teams#leave", as: :leave_team

  post "/posts/:id/tweet", to: "posts#tweet", as: :tweet_post

end
