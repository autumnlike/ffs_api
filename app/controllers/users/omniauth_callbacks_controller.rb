class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!
  def google
    # ログイン制御は、session[:login] 内の Email 有無だけとする
    session[:login] = request.env['omniauth.auth'].info.email
    redirect_to members_index_path and return
  end

  # 失敗時のエラー表記とリダイレクト制御するために上書きしてます
  def failure
    if failure_message == 'Invalid hosted domain'
      flash[:warning] = ENV['GOOGLE_CLIENT_DOMAIN'] + 'でログインしてください'
    else
      flash[:warning] = '認証エラーが発生しました。再度お試しください。'
    end
    redirect_to root_path
  end

  def callback_url
    full_host + script_name + callback_path
  end
end
