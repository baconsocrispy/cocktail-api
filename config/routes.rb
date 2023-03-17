Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  
  devise_for :users, path: '', path_names: {
      sign_in: 'signin',
      sign_out: 'signout',
      registration: 'signup'
    },
    controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get '/csrf_token', to: 'csrf#token'

  devise_scope :user do 
    resources :sessions, defaults: { format: :json }
    resources :registrations, defaults: { format: :json }
    post '/users/user_ingredients', to: 'users/registrations#user_ingredients'
  end
 

  resources :recipes do 
    get :search, on: :collection
  end

  resources :sort_options
  resources :categories
  resources :ingredients

  resources :cabinets
end
