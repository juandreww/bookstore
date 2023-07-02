Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products do
    collection do
      post :create_food
    end
  end

  resources :books
  resources :book_categories
  resources :authors
end
