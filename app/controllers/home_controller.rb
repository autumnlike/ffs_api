class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index
  layout 'nologin'
  def index
    redirect_to members_path if defined? session[:login].email
  end
end
