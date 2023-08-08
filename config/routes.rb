Rails.application.routes.draw do
  # get 'comment/index'
  # get 'comment/create'
  # get 'comment/destroy'
  # get 'comment/update'
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
      resources :comments, only: [:create, :destroy, :update]
      get '/product_comment', to: 'comments#product_comment'
    end
  end
end
