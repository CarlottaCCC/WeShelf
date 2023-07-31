Rails.application.routes.draw do
  
  resources :posts
  root "pages#home"
  
  get "about" => 'pages#aboutus'
  get "ordina" => 'books#ordina'
  
  #root "books#index"
  #get 'books/:id/chapters/new', to: 'chapters#new'

  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  as :user do
    get "signin" => 'devise/sessions#new'
    get "signup" => 'devise/registrations#new'
    delete "signout" => 'devise/sessions#destroy'
    get "users" => 'users#index'
    

  end

  resources :users, only: [:show, :edit, :update, :followers, :following] do 
    member do 
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
      get 'follows/index_followers'
      get 'follows/index_following'
      
    end



  end
  

  #(fa la stessa cosa di "get 'users/:id', to: 'users#show', as: 'user'"")
  resources :books, shallow: true do

    member do
      get :cambiaprivacy
      get :dichiarapubblicato
      post 'follow', to: 'favorites#create'
      delete 'unfollow', to: 'favorites#destroy'
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
      end

    resources :chapters, shallow: true do

      get 'translations/index'
      get 'translations/translate'
      post 'translations/translate', as: :translate
      
      member do 
        post 'vote', to: 'votes#create'
        delete 'unvote', to: 'votes#destroy'
      end

      resources :comments
    end
    resources :reviews, shallow: true do
      resources :flags
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
