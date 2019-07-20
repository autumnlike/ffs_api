module V1
  class MemberFFS < Grape::API
    resources :member_ffs do
      desc 'returns matched members'
      get '/' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        @members = Member.joins(:member_ffs).select("members.*, member_ffs.*")

        # 検索条件は排他とする
        if params[:'91_type'].present?
          @members = @members.where('member_ffs.91_type': params[:'91_type'])
        elsif params[:'4_type'].present?
          @members = @members.where('member_ffs.4_type': params[:'4_type'])
        end

        present @members, with: V1::Entities::MemberEntity
      end
    end
  end
end
