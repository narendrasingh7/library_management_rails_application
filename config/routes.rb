Rails.application.routes.draw do
 
  devise_for :users, controllers: {
    session: 'users/sessions',
    registration: 'users/registrations',
    password: 'users/passwords'
  }

  # resources :users, only: %i[show edit ]
  # get "user_home/:id", to: "users#user_home"
  resources :users do
    member do
      get :user_home
    end
  end
  resources :books
  root to: "home#index"

  get "view_all_books", to: "books#index"
  get "my_books", to: "books#user_book"

  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
