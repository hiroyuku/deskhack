Rails.application.routes.draw do

  get 'top/index'
  root to: 'top#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  get "posts/index"
  resources :mypage
end
