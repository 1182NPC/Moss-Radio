Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  

  resources :residents
  resources :posts do
    resources :postlikes
    patch :publish
  end

  resources :radiosets, only: [:new, :create, :edit, :index, :destroy] do
    resources :postlikes
  end
  
end
