Rails.application.routes.draw do
  get 'movies/index'
  get 'movies/show'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: %i[index show new create] do
    resources :movies, only: :index
  end
end
