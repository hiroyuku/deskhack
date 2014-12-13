Rails.application.routes.draw do

  get 'top/index'
  root to: 'top#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  get "posts/index"
  resources :mypage

  # ------------------------- エラー処理 -------------------------
  get  '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
