module V1
  class Users < Grape::API
    resources :users do
      desc 'returns all users'
      get '/' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        @users = User.joins(:user_ffs).select("users.*, user_ffs.*")
        present @users, with: V1::Entities::UserEntity
      end

      desc 'ユーザ詳細を取得する'
      get '/:id' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        @user = User.joins(:user_ffs).select("users.*, user_ffs.*").where(id: params[:id]).first
        present @user, with: V1::Entities::UserEntity
      end
    end
  end
end
