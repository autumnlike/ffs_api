module V1
  class FFSApi < Grape::API
    resources :ffs do
      desc 'returns all ffs'
      get '/' do
        error!('401 Unauthorized', 401) if params[:token] != ENV['API_TOKEN']
        @ffs = FFS.all
        present @ffs, with: V1::Entities::FFSEntity
      end

      desc ''
      post '/test' do
      end
    end
  end
end
