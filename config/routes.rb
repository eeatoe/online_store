Rails.application.routes.draw do
  # Админпанель Solidus
  mount SolidusAdmin::Engine, at: '/admin', constraints: ->(req) {
    req.cookies['solidus_admin'] != 'false' &&
    req.params['solidus_admin'] != 'false'
  }

  resources :products, only: [:index, :show] do
    resources :categories, only: [:index, :show], controller: 'taxons'
    get '/search', to: 'search#index'
  end
  resources :cart, only: [:show, :update, :destroy]
  resources :checkout # Оформление заказа (потом)
  resources :orders, only: [:index, :show] # Заказы (потом)


  # Главная страница — Продукты
  root to: 'store/products#index'

  mount Spree::Core::Engine, at: '/'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
