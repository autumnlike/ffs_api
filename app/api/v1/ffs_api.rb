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
						text: "It's 80 degrees right now.",
						attachments: [
								{
										text:"Partly cloudy today and tomorrow"
								}
						]
				}.to_json
      end
    end
  end
end
