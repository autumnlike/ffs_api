class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # ログイン制御は、session[:login] 内にUserInfoの有無とする
  def authenticate_user!
    redirect_to root_path and return if !session[:login]
  end
end
