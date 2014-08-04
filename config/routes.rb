Rails.application.routes.draw do

  get 'top/index'
  root to: 'top#index'

  resources :message


end
