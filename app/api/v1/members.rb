module V1
  class Members < Grape::API
    resources :members do
      desc 'returns all members'
      get '/' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        @members = Member.joins(:member_ffs).select("members.*, member_ffs.*")
        present @members, with: V1::Entities::MemberEntity
      end

      desc 'ユーザ詳細を取得する'
      get '/:id' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        @member = Member.joins(:member_ffs).select("members.*, member_ffs.*").where(id: params[:id]).first
        present @member, with: V1::Entities::MemberEntity
      end
    end
  end
end
