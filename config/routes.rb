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
  resources :foods do
    collection do
      get 'bulk_create', to: 'foods#bulk_create'
    end
  end

  get 'food_bulk_create', to: 'foods#bulk_create'

  root to: 'searches#index'

  get 'search_form', to: 'searches#index'
  get 'search', to: 'searches#search'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }
end
