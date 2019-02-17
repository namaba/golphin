Rails.application.routes.draw do
  # root 'blogs#index'
  root 'homes#index'

  resources :blogs
  get 'search_rakuten_api', to: 'blogs#search_rakuten_api'
  get 'search_plans_api', to: 'blogs#search_plans_api'

  resources :users, only: [:index, :show]

  resources :homes do
    collection do
      post 'results', to: 'homes#results'
      get 'results_2', to: 'homes#results_2'
      get 'index_2', to: 'homes#index_2'
    end
  end
end
