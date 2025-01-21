Rails.application.routes.draw do
  resources :authors
  resources :books
  resources :genres
  root "books#index"
end
