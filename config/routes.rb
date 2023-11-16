Rails.application.routes.draw do
  resources :questions, only: [:index, :show, :new, :create, :edit]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "questions#new"
  # root "articles#index"
end
