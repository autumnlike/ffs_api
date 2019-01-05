module V1
  # Slack コマンドリクエスト用
  class SlackApi < Grape::API
    resources :slack do
      desc 'ffs説明一覧を返す'
      post '/ffs' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        Slack.auth_test
      end

      desc '指定ユーザのFFS結果を返す'
      post '/user' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        member = []
        members = Slack.users_list['members'].each do |m|
          # @akiyoshi.satoshi -> akiyoshisatoshiにして検索
          if m['profile']['display_name'].gsub(/[@.]/, '') == params[:text].gsub(/[@.]/, '')
            member = m
            break
          end
        end
 
        # 一致しない場合
        return "#{params[:text]} はいません" if member.empty?
 
        user = User.find_by email: member['profile']['email']
 
        # 一致しない場合
        return "#{params[:text]} はいましたが、登録されているメールアドレスが違うようです。(#{member['profile']['email']}) 問合せてください。" if user.nil?

        user = User.find 1

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
