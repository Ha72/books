Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root to: "books#index"
  
  resources :books, only: %i[index show]
  
  get "/books_new", to: "books#new"
  
  get "/books_onsale", to: "books#on_sale"
  
  get "/books_recentlyupdated", to: "books#recently_updated"
  
  resources :genres, only: %i[index show]
  
end
