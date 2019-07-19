Rails.application.routes.draw do
  mount Base::API => '/'

  root 'users#index'

  # ユーザー
  get '/users/index' => 'users#index'
end
