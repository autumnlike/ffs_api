module V1
  class FFSApi < Grape::API
    resources :ffs do
      desc 'returns all ffs'
      get '/' do
        @ffs = FFS.all
        present @ffs, with: V1::Entities::FFSEntity
      end

      desc ''
      post '/test' do
        member = []
        members = Slack.users_list['members'].each do |m|
          if m['profile']['display_name'] == params[:text].sub(/@/, '')
            member = m
            break
          end
        end

        # 一致しない場合
        return "#{params[:text]} はいません" if member.empty?

        user = User.find_by email: member['profile']['email']

        # 一致しない場合
        return "#{params[:text]} はいましたが、登録されているメールアドレスが違うようです。(#{member['profile']['email']}) 問合せてください。" if user.nil?

        {
          attachments: SlackService::attachments_by_user(user)
        }
      end
    end
  end
end
