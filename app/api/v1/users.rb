module V1
  class Users < Grape::API
    resources :users do
      desc 'returns all users'
      get '/' do
        @users = User.joins(:user_ffs).select("users.*, user_ffs.*")
        present @users, with: V1::Entities::UserEntity
      end
    end
  end
end
