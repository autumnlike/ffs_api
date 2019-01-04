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
				"It's 80 degrees right now."
      end
    end
  end
end
