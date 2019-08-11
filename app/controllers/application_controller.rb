class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_manager

  # ログイン制御は、session[:login] 内にUserInfoの有無とする
  def authenticate_user!
    redirect_to root_path and return if !session[:login]
  end

  # ログイン者がマネージャかどうか
  def set_manager
    return if !defined? session[:login]
    email = session[:login].email
    @is_manager = !!Manager.find_by(email: email)
  end
end
