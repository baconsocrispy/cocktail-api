Rails.application.routes.draw do
  resources :sort_options
  resources :categories
  resources :recipes do 
    get :search, on: :collection
  end
  resources :ingredients
  resources :cabinets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
