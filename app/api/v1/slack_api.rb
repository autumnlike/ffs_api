module V1
  # Slack コマンドリクエスト用
  class SlackApi < Grape::API
    resources :slack do
      desc 'ffs説明一覧を返す'
      post '/ffs' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        SlackService::attachments_by_ffs
      end

      desc '指定ユーザのFFS結果を返す'
      post '/user' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        name = params[:text].gsub(/[@.]/, '')
        member = {}
        Slack.users_list['members'].each do |m|
          # @akiyoshi.satoshi -> akiyoshisatoshiにして検索
          if m['profile']['display_name'].gsub(/[.]/, '').index(name).present? ||
            (m['profile']['email'].present? && m['profile']['email'].gsub(/[.]/, '').index(name).present?)
            member = m
            break
          end
        end
 
        # 一致しない場合
        return "#{name} はいません。検索フォーマットは `<lastname.firstname>` でお願いします。" if member.empty?
 
        user = User.find_by email: member['profile']['email']
 
        # 一致しない場合
        return "#{params[:text]} はいましたが、登録されているメールアドレスが違うようです。(#{member['profile']['email']}) 問合せてください。" if user.nil?

        user = User.find_by email: member['profile']['email']

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
      end
    end
  end
end
