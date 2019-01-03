module V1
  class FFSApi < Grape::API
    resources :ffs do
      desc 'returns all ffs'
      get '/' do
        @ffs = FFS.all
        present @ffs, with: V1::Entities::FFSEntity
      end
    end
  end
end
