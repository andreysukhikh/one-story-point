Rails.application.routes.draw do
  get 'home/homepage'
  resources :books
  resources :authors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#homepage'
end
