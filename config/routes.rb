Rails.application.routes.draw do
  # get 'carts/index'
  # get 'carts/show'
  # get 'carts/create'
  # get 'carts/destroy'
  # get 'user/index'
  # get 'user/create'
  # get 'user/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [ :index, :create, :show ]
      get '/me', to: 'users#me'
      post '/login', to: 'authentications#login'
      resources :products, only: [ :index, :show, :create, :destroy, :update ]
      get '/myproducts' , to: 'products#myproduct'
      resources :carts, only: [:index, :show, :create, :destroy]
    end
  end
end
