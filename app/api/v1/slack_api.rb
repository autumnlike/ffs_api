module V1
  # Slack コマンドリクエスト用
  class SlackApi < Grape::API
    resources :slack do
      desc 'ffs説明一覧を返す'
      post '/ffs' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        {
          attachments: SlackService::attachments_by_ffs
        }
      end

      desc '指定ユーザのFFS結果を返す'
      post '/user' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        name = params[:text].gsub(/[@. ]/, '')
        user = {}
        Slack.users_list['members'].each do |m|
          # @akiyoshi.satoshi -> akiyoshisatoshiにして検索
          if m['profile']['display_name'].gsub(/[.]/, '').index(name).present? ||
            (m['profile']['email'].present? && m['profile']['email'].gsub(/[.]/, '').index(name).present?)
            user = User.find_by email: m['profile']['email']
            break if user.present?
          end
        end
 
        # 一致しない場合
        return "#{name} はいません。検索フォーマットは `<lastname.firstname>` でお願いします。" if user.blank?

        {
          attachments: SlackService::attachments_by_user(user)
        }
      end

      desc '自分のFFS結果を返す'
      post '/my' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        result = Slack.users_info(user: params[:user_id])
        error!("404 Not Found #{params[:user_id]}", 404) unless result['ok']
        user = User.find_by email: result['user']['profile']['email']
        {
          attachments: SlackService::attachments_by_user(user)
        }
      end

      desc '自分と同質のFFS結果を返す'
      post '/same_user' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']

        result = Slack.users_info(user: params[:user_id])
        error!("404 Not Found #{params[:user_id]}", 404) unless result['ok']
        user = User.find_by email: result['user']['profile']['email']
        {
          attachments: SlackService::attachments_by_same_user(user)
        }
      end

      desc '指定個性（91_type）のFFS結果を返す'
      post '/user_type' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        {
          attachments: SlackService::attachments_by_91_type(params[:text])
        }
      end
    end
  end
end
