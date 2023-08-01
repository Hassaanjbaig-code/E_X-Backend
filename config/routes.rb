Rails.application.routes.draw do
  # get 'user/index'
  # get 'user/create'
  # get 'user/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [ :index, :create, :show ]
      resources :products, only: [ :index, :show, :create ]
    end
  end
end
