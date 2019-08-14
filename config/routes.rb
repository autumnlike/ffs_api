Rails.application.routes.draw do
  mount Base::API => '/'

  root 'home#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/users/destroy' => 'users#destroy'

  # メンバー
  resources :members

  # チーム
  resources :teams
  get '/teams/:id/delete' => 'teams#destroy'

  post '/team_members' => 'team_members#create'
  get '/team_members/:id/delete' => 'team_members#destroy'

  # 説明系
  get '/infos/index' => 'infos#index'
end
