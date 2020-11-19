Rails.application.routes.draw do
  
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root to: "books#index"
  
  resources :books, only: %i[index show] do
      collection do
          get "search"
      end
  end
  
  get "/books_new", to: "books#new"
  
  get "/books_onsale", to: "books#on_sale"
  
  get "/books_recentlyupdated", to: "books#recently_updated"
  
  resources :genres, only: %i[index show]
  
  get "/about", to: "pages#about"
  
  get "/contact", to: "pages#contact"
  
  get "/manage_account", to: "pages#manage"
  
  resources :cart, only: %i[create destroy]
  
  get "/shopping_cart", to: "cart#index"
  
  
end
