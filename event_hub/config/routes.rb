Rails.application.routes.draw do
  get "users/index"
  get "users/show"
  get "locations/index"
  get "locations/show"
  get "categories/index"
  get "categories/show"
  get "events/index"
  get "events/show"
  root "events#index"

  resources :events,     only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :locations,  only: [:index, :show]
  resources :users,      only: [:index, :show]
end