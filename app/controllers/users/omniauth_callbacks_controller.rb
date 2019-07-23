class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!
  def google
    session[:login] = request.env['omniauth.auth'].info.email
    redirect_to members_index_path and return
  end

  def failure
    if failure_message == 'Invalid hosted domain'
      flash[:warning] = ENV['GOOGLE_CLIENT_DOMAIN'] + 'でログインしてください'
    else
      flash[:warning] = '認証エラーが発生しました。再度お試しください。'
    end
    redirect_to root_path
  end

  # def google
  #   redirect_to root_path and return
  #   @user = User.find_for_google(request.env['omniauth.auth'])
  #   if @user.persisted?
  #     flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session['devise.google_data'] = request.env['omniauth.auth']
  #     redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
  #   end
  # end

  def callback_url
    full_host + script_name + callback_path
  end
end
