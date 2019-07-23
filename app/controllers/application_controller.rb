class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # ログイン制御は、session[:login] 内の Email 有無だけとする
  def authenticate_user!
    redirect_to root_path and return if !session[:login]
  end
end
