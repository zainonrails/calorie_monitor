Rails.application.routes.draw do
  resources :intakes do
    collection do
      post 'meal_intake'
      post 'food_intake'
    end
  end

  get 'profile', to: 'profiles#index'
  resources :foods
  resources :meals
  resources :foods
  resources :bulk_foods, only: %i[new create]

  root to: 'searches#index'

  get 'search_form', to: 'searches#index'
  get 'search', to: 'searches#search'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
end
