class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index
  layout 'nologin'
  def index
    redirect_to members_index_path if session[:login]
  end
end
