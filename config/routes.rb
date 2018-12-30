Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :blogs
  get 'search_rakuten_api', to: 'blogs#search_rakuten_api'

  root 'blogs#index'
end
