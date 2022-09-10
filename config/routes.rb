Rails.application.routes.draw do
  resources :books
  resources :authors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'books#index'
end
