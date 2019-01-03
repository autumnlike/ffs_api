module V1
  class UserFFS < Grape::API
    resources :user_ffs do
      desc 'returns matched users'
      get '/' do
        @users = User.joins(:user_ffs).select("users.*, user_ffs.*")

        # 検索条件は排他とする
        if params[:'91_type'].present?
          @users = @users.where('user_ffs.91_type': params[:'91_type'])
        elsif params[:'4_type'].present?
          @users = @users.where('user_ffs.4_type': params[:'4_type'])
        end

        present @users, with: V1::Entities::UserEntity
      end
    end
  end
end
