Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get '/csrf_token', to: 'csrf#token'

  resources :recipes do 
    get :search, on: :collection
  end

  resources :sort_options
  resources :categories
  resources :ingredients

  resources :cabinets
end
