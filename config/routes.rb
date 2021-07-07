Rails.application.routes.draw do
  root to: "home#index"
  resources :users, except: [:index]
  resources :cart_items, except: [:show, :new, :edit]
  resources :orders, except: [:edit]
  resources :addresses
  resources :menu_category_items

  get "/signup" => "users#new", as: :signup
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_sessions
end
