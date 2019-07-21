Rails.application.routes.draw do
  mount Base::API => '/'

  root 'members#index'

  # メンバー
  get '/members/index' => 'members#index'

  # チーム
  resources :teams
  post '/team_members' => 'team_members#create'
  get '/team_members/:id/delete' => 'team_members#destroy'

  # 説明系
  get '/infos/index' => 'infos#index'
end
