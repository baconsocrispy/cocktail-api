Rails.application.routes.draw do
  resources :tools
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

  get 'cabinet_ingredients/:id', to: 'cabinets#cabinet_ingredients'

  post 'update_current_cabinet/:id', to: 'current_user#update_current_cabinet'

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
