Rails.application.routes.draw do
  mount Base::API => '/'

  root 'members#index'

  # ユーザー
  get '/members/index' => 'members#index'

  # 説明系
  get '/infos/index' => 'infos#index'
end
