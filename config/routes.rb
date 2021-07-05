Rails.application.routes.draw do
  root to: "home#index"
  resources :users, except: [:show, :index]
  resources :cart_items, except: [:show, :new]

  get "/signup" => "users#new", as: :signup
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_sessions
end
