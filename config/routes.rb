Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/user/current_user', to: 'users/sessions#current_user'
  end

  resources :recipes do 
    get :search, on: :collection
  end

  resources :sort_options
  resources :categories
  resources :ingredients

  resources :cabinets
end
