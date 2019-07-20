Rails.application.routes.draw do
  mount Base::API => '/'

  root 'members#index'

  # メンバー
  get '/members/index' => 'members#index'

  # チーム
  resources :teams

  # 説明系
  get '/infos/index' => 'infos#index'
end
