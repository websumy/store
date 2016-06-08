Rails.application.routes.draw do

  root to: 'store#index', as: 'store'

  resources :products, except: :index
  resources :line_items, only: [:create, :update, :destroy]
  resources :carts, only: [:show]
  resources :orders, except: [:edit, :update]

  # session
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: :logout

end
