Rails.application.routes.draw do
  root 'blogs#index'

  resources :blogs
  get 'search_rakuten_api', to: 'blogs#search_rakuten_api'
  get 'search_plans_api', to: 'blogs#search_plans_api'

  resources :users, only: [:index, :show]

  resources :homes

end
