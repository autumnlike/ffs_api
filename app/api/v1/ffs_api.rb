module V1
  class FFSApi < Grape::API
    resources :ffs do
      desc 'returns all ffs'
      get '/' do
        @ffs = FFS.all
        present @ffs, with: V1::Entities::FFSEntity
      end

      desc ''
      get '/test' do
        {
          text: 'success',
          attachments: SlackService::attachments_by_user(User.find(1))
        }
      end
    end
  end
end
