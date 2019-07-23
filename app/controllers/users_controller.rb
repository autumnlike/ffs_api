class UsersController < ApplicationController
  def destroy
    session[:login] = false;
    redirect_to root_path
  end
end
