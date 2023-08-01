Rails.application.routes.draw do
 
  devise_for :users, controllers: {
    session: 'users/sessions',
    registration: 'users/registrations',
    password: 'users/passwords'
  }

  # resources :users, only: %i[show edit ]
  resources :users
  resources :books
  root to: "home#index"

  get "view_all_books", to: "books#index"
  get "my_books", to: "books#user_book"
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
