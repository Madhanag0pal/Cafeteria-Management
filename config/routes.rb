Rails.application.routes.draw do
  root to: "home#index"
  get "/search" => "home#search", as: :search
  resources :users
  resources :cart_items, except: [:show, :new, :edit]
  resources :orders, except: [:edit]
  resources :addresses
  resources :menu_items
  resources :menu_category_items
  resources :menu_categories

  get "/signup" => "users#new", as: :signup
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_sessions
end
