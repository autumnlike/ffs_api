class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_user!
    redirect_to root_path and return if !session[:login]
    true
  end
end
